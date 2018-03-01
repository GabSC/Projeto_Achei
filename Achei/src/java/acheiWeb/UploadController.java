package acheiWeb;

import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import sun.misc.BASE64Encoder;

@Controller
public class UploadController {

    @RequestMapping(value = "uploadFoto", method = RequestMethod.POST)
    public @ResponseBody
    String upload(MultipartFile file) {

        BASE64Encoder bE = new BASE64Encoder();
        try {
            String img = "data:";
            img += file.getContentType();
            img += ";base64,";
            img += bE.encode(file.getBytes());
            return img;
        } catch (Exception ex) {
            Logger.getLogger(UploadController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @RequestMapping(value = "uploadFotoProfissional", method = RequestMethod.POST)
    public @ResponseBody
    String uploadFoto(MultipartFile file) {

        BASE64Encoder bE = new BASE64Encoder();
        try {
            String img = "data:";
            img += file.getContentType();
            img += ";base64,";
            img += bE.encode(file.getBytes());
            return img;
        } catch (Exception ex) {
            Logger.getLogger(UploadController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    @RequestMapping(value = "uploadCartaoProfissional", method = RequestMethod.POST)
    public @ResponseBody
    String uploadcartaoVisitas(MultipartFile file) {

        BASE64Encoder bE = new BASE64Encoder();
        try {
            String img = "data:";
            img += file.getContentType();
            img += ";base64,";
            img += bE.encode(file.getBytes());
            return img;
        } catch (Exception ex) {
            Logger.getLogger(UploadController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;

    }

};
