package site.bzyl.bitstore.repository;

import site.bzyl.bitstore.domain.UserToken;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserTokenMapper extends BaseMapper<UserToken> {

    UserToken getToken(String token);

}
