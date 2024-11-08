package site.bzyl.island.viewmodel.admin.task;

import site.bzyl.island.base.BasePage;



public class TaskPageRequestVM extends BasePage {
    private Integer gradeLevel;

    public Integer getGradeLevel() {
        return gradeLevel;
    }

    public void setGradeLevel(Integer gradeLevel) {
        this.gradeLevel = gradeLevel;
    }
}
