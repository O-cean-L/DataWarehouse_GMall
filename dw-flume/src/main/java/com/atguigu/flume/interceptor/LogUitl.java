package com.atguigu.flume.interceptor;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;

public class LogUitl {
    public static boolean validataStart(String msg) {
        //判断是否为空，空则过滤
        if (StringUtils.isBlank(msg.trim())) {
            return false;
        }
        if (!msg.trim().startsWith("{") || !msg.trim().endsWith("}")) {
            return false;
        }

        return true;
    }

    public static boolean validataEvent(String msg) {
        if (StringUtils.isBlank(msg.trim())) {
            return false;
        }

        String[] split = msg.split("\\|");
        String ts = split[0].trim();
        //不是13位或不是数字
        if (ts.length() != 13 || !NumberUtils.isDigits(ts)){
            return false;
        }

        String event = split[1].trim();
        if (!event.trim().startsWith("{") || !event.trim().endsWith("}")) {
            return false;
        }

        return true;
    }
}
