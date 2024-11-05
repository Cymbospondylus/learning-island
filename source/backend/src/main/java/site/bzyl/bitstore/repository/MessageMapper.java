package site.bzyl.bitstore.repository;

import site.bzyl.bitstore.domain.Message;
import site.bzyl.bitstore.viewmodel.admin.message.MessagePageRequestVM;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MessageMapper extends BaseMapper<Message> {

    List<Message> page(MessagePageRequestVM requestVM);

    List<Message> selectByIds(List<Integer> ids);

    int readAdd(Integer id);
}
