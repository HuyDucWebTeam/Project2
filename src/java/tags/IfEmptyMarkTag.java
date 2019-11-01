package tags;

import java.io.IOException;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class IfEmptyMarkTag extends TagSupport{
    private String field;
    private String color = "red";
    private String style;
    
    public void setField(String field){
        this.field = field;
    }
    
    public void setColor(String color){
        this.color = color;
    }
    
    public void setStyle(String style){
        this.style = style;
    }

    @Override
    public int doStartTag() throws JspException {
        try {
            JspWriter out = pageContext.getOut();
            if(field == null || field.length() == 0){
                out.print("<font color=" + color + "> *</font>");   
            }
        } catch (IOException ioe) {
            ioe.printStackTrace();
        }
        return SKIP_BODY;
    }
    
    
}
