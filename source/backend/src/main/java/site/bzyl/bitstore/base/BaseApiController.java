package site.bzyl.bitstore.base;


import site.bzyl.bitstore.context.WebContext;
import site.bzyl.bitstore.domain.User;
import site.bzyl.bitstore.utility.ModelMapperSingle;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @version 3.3.0
 * @description: The type Base api controller.
 */
public class BaseApiController {
    /**
     * The constant DEFAULT_PAGE_SIZE.
     */
    protected final static String DEFAULT_PAGE_SIZE = "10";
    /**
     * The constant modelMapper.
     */
    protected final static ModelMapper modelMapper = ModelMapperSingle.Instance();
    /**
     * The Web context.
     */
    @Autowired
    protected WebContext webContext;

    /**
     * Gets current user.
     *
     * @return the current user
     */
    protected User getCurrentUser() {
        return webContext.getCurrentUser();
    }
}
