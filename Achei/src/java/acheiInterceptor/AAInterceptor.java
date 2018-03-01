package acheiInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jrr.achei.model.entity.Usuario;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AAInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        boolean shallPass = true;

        String uri = request.getRequestURI();
        String context = "/web";

        return shallPass;
    }
}
