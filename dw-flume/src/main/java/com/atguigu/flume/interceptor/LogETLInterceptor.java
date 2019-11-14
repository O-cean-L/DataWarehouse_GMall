package com.atguigu.flume.interceptor;

import org.apache.flume.Context;
import org.apache.flume.Event;
import org.apache.flume.interceptor.Interceptor;

import java.nio.charset.Charset;
import java.util.Iterator;
import java.util.List;

public class LogETLInterceptor implements Interceptor {
    @Override
    public void initialize() {

    }

    @Override
    public Event intercept(Event event) {
        if (event == null) {
            return null;
        }
        byte[] body = event.getBody();
        String msg = new String(body, Charset.forName("utf-8"));
        if (msg.contains("\"en\":\"start\"")) {
            if(LogUitl.validataStart(msg)){
                return event;
            }
        }else {
            if(LogUitl.validataEvent(msg)){
                return event;
            }
        }
        return null;
    }

    @Override
    public List<Event> intercept(List<Event> events) {
        Iterator<Event> it = events.iterator();
        while (it.hasNext()) {
            Event event = it.next();
            if (intercept(event) == null) {
                it.remove();
            }
        }
        return events;
    }

    @Override
    public void close() {

    }

    public static class Builder implements Interceptor.Builder{

        @Override
        public Interceptor build() {
            return new LogETLInterceptor();
        }

        @Override
        public void configure(Context context) {

        }
    }
}
