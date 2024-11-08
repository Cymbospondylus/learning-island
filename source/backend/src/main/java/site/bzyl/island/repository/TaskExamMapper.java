package site.bzyl.island.repository;

import site.bzyl.island.domain.TaskExam;
import site.bzyl.island.viewmodel.admin.task.TaskPageRequestVM;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TaskExamMapper extends BaseMapper<TaskExam> {

    List<TaskExam> page(TaskPageRequestVM requestVM);

    List<TaskExam> getByGradeLevel(Integer gradeLevel);
}
