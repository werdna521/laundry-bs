package com.android.cen.andrew.laundrybs;

import android.os.Handler;
import android.support.annotation.NonNull;
import android.support.v4.widget.SwipeRefreshLayout;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MainActivity extends AppCompatActivity {
    private static final String url1 =
            "http://web.binus.ac.id/binussquare/LaundryQueue/DropInQueue.aspx/GetData";
    private static final String url2 =
            "http://web.binus.ac.id/binussquare/LaundryQueue/DropInQueue.aspx/CountQueue";
    private TextView mRemainingQueueTextView;
    private TextView mCopyrightTextView;
    private RecyclerView mRecyclerView;
    private List<Counter> counters;
    private CounterAdapter mAdapter;
    private SwipeRefreshLayout mSwipeRefreshLayout;

    public class CounterHolder extends RecyclerView.ViewHolder {
        private TextView mCounterNameTextView;
        private TextView mNameTextView;
        private TextView mQueueNumberTextView;
        private Counter mCounter;

        public CounterHolder(View view) {
            super(view);
            mCounterNameTextView = view.findViewById(R.id.counter_name_text_view);
            mNameTextView = view.findViewById(R.id.name_text_view);
            mQueueNumberTextView = view.findViewById(R.id.queue_number_text_view);
        }

        public void bindCounter(Counter counter) {
            mCounter = counter;
            mCounterNameTextView.setText(mCounter.getCounterName());
            mNameTextView.setText(mCounter.getName());
            mQueueNumberTextView.setText(mCounter.getQueueNumber());
        }
    }

    public class CounterAdapter extends RecyclerView.Adapter<CounterHolder> {

        @Override
        public void onBindViewHolder(@NonNull CounterHolder counterHolder, int i) {
            counterHolder.bindCounter(counters.get(i));
        }

        @NonNull
        @Override
        public CounterHolder onCreateViewHolder(@NonNull ViewGroup viewGroup, int i) {
            View v = LayoutInflater.from(MainActivity.this).inflate(
                    R.layout.counter_card_view, viewGroup, false);
            return new CounterHolder(v);
        }

        @Override
        public int getItemCount() {
            return counters.size();
        }
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mRemainingQueueTextView = findViewById(R.id.remaining_queue_text_view);
        mCopyrightTextView = findViewById(R.id.copyright_text_view);

        mSwipeRefreshLayout = findViewById(R.id.swipe);
        mSwipeRefreshLayout.setOnRefreshListener(new SwipeRefreshLayout.OnRefreshListener() {
            @Override
            public void onRefresh() {
                new Handler().postDelayed(new Runnable() {
                    @Override
                    public void run() {
                        mSwipeRefreshLayout.setRefreshing(false);
                        updateUI();
                    }
                }, 1000);
            }
        });

        mRecyclerView = findViewById(R.id.recycler_view);
        mRecyclerView.setLayoutManager(new LinearLayoutManager(this));

        counters = new ArrayList<>();

        doVolley();
        updateUI();
    }

    private void updateUI() {
        if (mAdapter == null) {
            mAdapter = new CounterAdapter();
            mRecyclerView.setAdapter(mAdapter);
        } else {
            doVolley();
            mAdapter.notifyDataSetChanged();
        }
        updateCopyright();
    }

    private void updateCopyright() {
        Calendar calendar = Calendar.getInstance();
        Integer year = calendar.get(Calendar.YEAR);

        String s = "© Andrew Cen ";
        if (year == 2019) {
            s += "2019";
        } else if (year > 2019) {
            s += "2019 - " + year.toString();
        } else {
            s += "2019";
        }

        mCopyrightTextView.setText(s);
    }

    private void doVolley() {
        volley1();
        volley2();
    }

    private void volley1() {
        RequestQueue requestQueue = Volley.newRequestQueue(this);

        JsonObjectRequest queueRequest = new JsonObjectRequest(Request.Method.POST, url1, null,
                new Response.Listener<JSONObject>() {
                    @Override
                    public void onResponse(JSONObject response) {
                        try {
                            counters.clear();
                            JSONArray array = response.getJSONArray("d");
                            for (int i = 0; i < array.length(); ++i) {
                                JSONObject object = array.getJSONObject(i);
                                String counterName = object.getString("CounterName");
                                Log.d("volley", counterName);
                                String name = object.getString("Name");
                                Log.d("volley", name);
                                String queueNo = object.getString("QueueNo");
                                Log.d("volley", queueNo);
                                counters.add(new Counter(counterName, name, queueNo));
                            }
                        } catch (Exception e) {
                            Log.d("volley", e.getMessage());
                        }
                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        Log.d("volley", error.getMessage());
                    }
                }) {
            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                Map<String, String> params = new HashMap<>();
                params.put("content-type", "application/json");
                return params;
            }
        };

        requestQueue.add(queueRequest);
    }

    private void volley2() {
        RequestQueue requestQueue = Volley.newRequestQueue(this);

        JsonObjectRequest queueNumberRequest = new JsonObjectRequest(Request.Method.POST, url2, null,
                new Response.Listener<JSONObject>() {
                    @Override
                    public void onResponse(JSONObject response) {
                        try {
                            mRemainingQueueTextView.setText(getString(R.string.remaining_queue) +
                                    response.getString("d"));
                        } catch (Exception e) {
                            Log.d("volley", e.getMessage());
                        }
                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        Log.d("volley", error.getMessage());
                    }
                }) {
            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                Map<String, String> params = new HashMap<>();
                params.put("content-type", "application/json");
                return params;
            }
        };

        requestQueue.add(queueNumberRequest);
    }
}
