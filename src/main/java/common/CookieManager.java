package common;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

public class CookieManager {

    public static void createCookie(HttpServletResponse response, String name, String value,
                                    int time) {
        Cookie cookie = new Cookie(name,value);
        cookie.setMaxAge(time);
        cookie.setPath("/");
        response.addCookie(cookie);
    }
}
