package team.idvances.speaceapp2017;

import android.app.Activity;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.widget.TextView;

import com.android.volley.Response;
import com.android.volley.toolbox.ImageLoader;
import com.android.volley.toolbox.NetworkImageView;
import com.android.volley.toolbox.Volley;

import org.json.JSONArray;
import org.json.JSONObject;

import static team.idvances.speaceapp2017.MapsActivity.volleyRequest;

/**
 * Created by William on 2017/4/30.
 */

public class ContentActivity extends Activity {

    TextView title,des;
    NetworkImageView imageView;
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_content);
        imageView = (NetworkImageView) findViewById(R.id.networkImageView);
        title = (TextView) findViewById(R.id.titleText);
        des = (TextView) findViewById(R.id.desText);

        String data_id = getIntent().getExtras().getString("data_id");
        volleyRequest(Volley.newRequestQueue(this), this, "http://10.20.8.124/speaceapp/API/get_detail_info.php","access_key=1qaz2wsx&data_id="+data_id, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                try{
                    JSONArray array = new JSONArray(response);

                    //[{"data_id":"57","timestemp":"2017-04-30 09:14:25","type_id":"2","tag":"NULL","img_url":"http:\/\/www.ancient.eu\/img\/r\/p\/750\/2319.jpg?v=1485680608","shortcut_img_base64":"NULL","title":"Nile","description":"http:\/\/www.ancient.eu\/nile\/","memo":"NULL"}]
                    JSONObject obj = array.getJSONObject(0);
                    title.setText(obj.getString("title"));
                    des.setText(obj.getString("description"));
                    LruImageCache lruImageCache = LruImageCache.instance();
                    imageView.setImageUrl(obj.getString("img_url"),new ImageLoader(Volley.newRequestQueue(ContentActivity.this), lruImageCache));
                }catch (Exception e){
                    e.printStackTrace();
                }
            }
        },null);

    }


}
