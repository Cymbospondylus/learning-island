package site.bzyl.island.viewmodel.student.user;

import site.bzyl.island.base.BasePage;

public class MessageRequestVM extends BasePage {

    private Integer receiveUserId;

    public Integer getReceiveUserId() {
        return receiveUserId;
    }

    public void setReceiveUserId(Integer receiveUserId) {
        this.receiveUserId = receiveUserId;
    }
}
