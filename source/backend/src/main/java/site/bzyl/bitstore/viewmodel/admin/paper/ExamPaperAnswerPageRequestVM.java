package site.bzyl.bitstore.viewmodel.admin.paper;

import site.bzyl.bitstore.base.BasePage;

public class ExamPaperAnswerPageRequestVM extends BasePage {
    private Integer subjectId;

    public Integer getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(Integer subjectId) {
        this.subjectId = subjectId;
    }
}
