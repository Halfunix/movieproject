package pkg.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

    MemberService memberService;

    @RequestMapping("login")
    public String login (Model model, HttpServletRequest request, HttpServletResponse response) {

        return "login";
    }

    public String logout () {

        return "";
    };

    public String register () {

        return "";
    }

    public String resign () {
        
        return "";
    }

}
