package site.bzyl.island.service;

import site.bzyl.island.domain.TaskExam;
import site.bzyl.island.domain.User;
import site.bzyl.island.viewmodel.admin.task.TaskPageRequestVM;
import site.bzyl.island.viewmodel.admin.task.TaskRequestVM;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface TaskExamService extends BaseService<TaskExam> {

    PageInfo<TaskExam> page(TaskPageRequestVM requestVM);

    void edit(TaskRequestVM model, User user);

    TaskRequestVM taskExamToVM(Integer id);

    List<TaskExam> getByGradeLevel(Integer gradeLevel);
}
