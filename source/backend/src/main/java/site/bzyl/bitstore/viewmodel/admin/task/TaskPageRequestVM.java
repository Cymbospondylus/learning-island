package site.bzyl.bitstore.viewmodel.admin.task;

import site.bzyl.bitstore.base.BasePage;



public class TaskPageRequestVM extends BasePage {
    private Integer gradeLevel;

    public Integer getGradeLevel() {
        return gradeLevel;
    }

    public void setGradeLevel(Integer gradeLevel) {
        this.gradeLevel = gradeLevel;
    }
}
