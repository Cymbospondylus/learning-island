package site.bzyl.bitstore.viewmodel.student.user;

import site.bzyl.bitstore.base.BasePage;

public class MessageRequestVM extends BasePage {

    private Integer receiveUserId;

    public Integer getReceiveUserId() {
        return receiveUserId;
    }

    public void setReceiveUserId(Integer receiveUserId) {
        this.receiveUserId = receiveUserId;
    }
}
