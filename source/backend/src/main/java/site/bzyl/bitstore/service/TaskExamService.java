package site.bzyl.bitstore.service;

import site.bzyl.bitstore.domain.TaskExam;
import site.bzyl.bitstore.domain.User;
import site.bzyl.bitstore.viewmodel.admin.task.TaskPageRequestVM;
import site.bzyl.bitstore.viewmodel.admin.task.TaskRequestVM;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface TaskExamService extends BaseService<TaskExam> {

    PageInfo<TaskExam> page(TaskPageRequestVM requestVM);

    void edit(TaskRequestVM model, User user);

    TaskRequestVM taskExamToVM(Integer id);

    List<TaskExam> getByGradeLevel(Integer gradeLevel);
}
