package site.bzyl.bitstore.controller.wx;

import site.bzyl.bitstore.context.WxContext;
import site.bzyl.bitstore.domain.User;
import site.bzyl.bitstore.domain.UserToken;
import site.bzyl.bitstore.utility.ModelMapperSingle;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;

public class BaseWXApiController {
    protected final static ModelMapper modelMapper = ModelMapperSingle.Instance();
    @Autowired
    private WxContext wxContext;

    protected User getCurrentUser() {
        return wxContext.getCurrentUser();
    }

    protected UserToken getUserToken() {
        return wxContext.getCurrentUserToken();
    }
}
