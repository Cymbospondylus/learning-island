package site.bzyl.bitstore.service;

import site.bzyl.bitstore.domain.Message;
import site.bzyl.bitstore.domain.MessageUser;
import site.bzyl.bitstore.viewmodel.admin.message.MessagePageRequestVM;
import site.bzyl.bitstore.viewmodel.student.user.MessageRequestVM;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface MessageService {

    List<Message> selectMessageByIds(List<Integer> ids);

    PageInfo<MessageUser> studentPage(MessageRequestVM requestVM);

    PageInfo<Message> page(MessagePageRequestVM requestVM);

    List<MessageUser> selectByMessageIds(List<Integer> ids);

    void sendMessage(Message message, List<MessageUser> messageUsers);

    void read(Integer id);

    Integer unReadCount(Integer userId);

    Message messageDetail(Integer id);
}
