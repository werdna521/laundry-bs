package com.android.cen.andrew.laundrybs;

public class Counter {
    private String mCounterName;
    private String mName;
    private String mQueueNumber;

    public String getCounterName() {
        return mCounterName;
    }

    public String getName() {
        return mName;
    }

    public String getQueueNumber() {
        return mQueueNumber;
    }

    @Override
    public String toString() {
        return mCounterName + ", " + mName + ", " + mQueueNumber;
    }

    public Counter(String counterName, String name, String queueNumber) {
        mCounterName = counterName;
        mName = name;
        mQueueNumber = queueNumber;
    }
}
