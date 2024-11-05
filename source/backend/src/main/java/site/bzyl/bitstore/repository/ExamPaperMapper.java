package site.bzyl.bitstore.repository;

import site.bzyl.bitstore.domain.ExamPaper;
import site.bzyl.bitstore.domain.other.KeyValue;
import site.bzyl.bitstore.viewmodel.admin.exam.ExamPaperPageRequestVM;
import site.bzyl.bitstore.viewmodel.student.dashboard.PaperFilter;
import site.bzyl.bitstore.viewmodel.student.dashboard.PaperInfo;
import site.bzyl.bitstore.viewmodel.student.exam.ExamPaperPageVM;
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
