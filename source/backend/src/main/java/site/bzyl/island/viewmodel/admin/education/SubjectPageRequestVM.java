package site.bzyl.island.viewmodel.admin.education;

import site.bzyl.island.base.BasePage;



public class SubjectPageRequestVM extends BasePage {
    private Integer id;
    private Integer level;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }
}
