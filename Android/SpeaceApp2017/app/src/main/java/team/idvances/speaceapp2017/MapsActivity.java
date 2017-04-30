package team.idvances.speaceapp2017;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.util.Log;

import com.android.volley.DefaultRetryPolicy;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.OnMapReadyCallback;
import com.google.android.gms.maps.SupportMapFragment;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.Marker;
import com.google.android.gms.maps.model.MarkerOptions;

import org.json.JSONArray;
import org.json.JSONObject;

import static team.idvances.speaceapp2017.R.id.map;

public class MapsActivity extends FragmentActivity implements OnMapReadyCallback {

    private GoogleMap mMap;
    private MarkerOptions[] arrayMarkerOptions;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_maps);
        // Obtain the SupportMapFragment and get notified when the map is ready to be used.
        SupportMapFragment mapFragment = (SupportMapFragment) getSupportFragmentManager()
                .findFragmentById(map);
        mapFragment.getMapAsync(this);


        volleyRequest(Volley.newRequestQueue(this), this, "http://10.20.8.124/speaceapp/API/get_local_info.php","access_key=1qaz2wsx&type=all", new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                try{
                    JSONArray array = new JSONArray(response);
                    if(array!=null&&array.length()>0){

                        arrayMarkerOptions = new MarkerOptions[array.length()];
                        for(int i=0;i<arrayMarkerOptions.length;i++){
                            JSONObject obj = array.getJSONObject(i);
                            LatLng latLng =  new LatLng(Double.parseDouble(obj.getString("latitude")),Double.parseDouble(obj.getString("longitude")));
                            arrayMarkerOptions[i] = new MarkerOptions().position(latLng).title(obj.getString("data_id")).snippet(obj.getString("local_id"));
                            String type_id = obj.getString("type_id");
                            if(type_id.equals("1"))arrayMarkerOptions[i].icon(BitmapDescriptorFactory.fromResource(R.drawable.icon_type_1s));
                            if(type_id.equals("2"))arrayMarkerOptions[i].icon(BitmapDescriptorFactory.fromResource(R.drawable.icon_type_2s));
                            if(type_id.equals("3"))arrayMarkerOptions[i].icon(BitmapDescriptorFactory.fromResource(R.drawable.icon_type_3s));

                            mMap.addMarker(arrayMarkerOptions[i]);
                        }
                        mMap.setOnMarkerClickListener(new GoogleMap.OnMarkerClickListener()
                        {

                            @Override
                            public boolean onMarkerClick(Marker arg0) {
                                 Intent intent = new Intent(MapsActivity.this, ContentActivity.class);
                                 Bundle bundle = new Bundle();
                                 bundle.putString("data_id",arg0.getTitle());
                                 intent.putExtras(bundle);
                                 startActivity(intent);
                                return true;
                            }
                        });

                    }
                }catch (Exception e){
                    e.printStackTrace();
                }
            }
        },null);

    }

    public static void volleyRequest(RequestQueue queue, final Context context, String url, String parameter, Response.Listener<String> listener, Response.ErrorListener errorListener ){
        Log.e("url",url+"?"+parameter);
        StringRequest stringRequest = new StringRequest(url+"?"+parameter,listener,errorListener);
        stringRequest.setRetryPolicy(new DefaultRetryPolicy(
                30000,// 10s
                DefaultRetryPolicy.DEFAULT_MAX_RETRIES,
                DefaultRetryPolicy.DEFAULT_BACKOFF_MULT));
        queue.add(stringRequest);
    }

    /**
     * Manipulates the map once available.
     * This callback is triggered when the map is ready to be used.
     * This is where we can add markers or lines, add listeners or move the camera. In this case,
     * we just add a marker near Sydney, Australia.
     * If Google Play services is not installed on the device, the user will be prompted to install
     * it inside the SupportMapFragment. This method will only be triggered once the user has
     * installed Google Play services and returned to the app.
     */
    @Override
    public void onMapReady(GoogleMap googleMap) {
        mMap = googleMap;
//
//        // Add a marker in Sydney and move the camera
//        LatLng sydney = new LatLng(-34, 151);
//        mMap.addMarker(new MarkerOptions().position(sydney).title("Marker in Sydney"));
//        mMap.moveCamera(CameraUpdateFactory.newLatLng(sydney));
    }
}
