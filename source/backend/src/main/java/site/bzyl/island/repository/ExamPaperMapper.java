package site.bzyl.island.repository;

import site.bzyl.island.domain.ExamPaper;
import site.bzyl.island.domain.other.KeyValue;
import site.bzyl.island.viewmodel.admin.exam.ExamPaperPageRequestVM;
import site.bzyl.island.viewmodel.student.dashboard.PaperFilter;
import site.bzyl.island.viewmodel.student.dashboard.PaperInfo;
import site.bzyl.island.viewmodel.student.exam.ExamPaperPageVM;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

@Mapper
public interface ExamPaperMapper extends BaseMapper<ExamPaper> {

    List<ExamPaper> page(ExamPaperPageRequestVM requestVM);

    List<ExamPaper> taskExamPage(ExamPaperPageRequestVM requestVM);

    List<ExamPaper> studentPage(ExamPaperPageVM requestVM);

    List<PaperInfo> indexPaper(PaperFilter paperFilter);

    Integer selectAllCount();

    List<KeyValue> selectCountByDate(@Param("startTime") Date startTime, @Param("endTime") Date endTime);

    int updateTaskPaper(@Param("taskId") Integer taskId,@Param("paperIds") List<Integer> paperIds);

    int clearTaskPaper(@Param("paperIds") List<Integer> paperIds);
}
