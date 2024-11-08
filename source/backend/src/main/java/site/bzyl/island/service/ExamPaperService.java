package site.bzyl.island.service;

import site.bzyl.island.domain.ExamPaper;
import site.bzyl.island.domain.User;
import site.bzyl.island.viewmodel.admin.exam.ExamPaperEditRequestVM;
import site.bzyl.island.viewmodel.admin.exam.ExamPaperPageRequestVM;
import site.bzyl.island.viewmodel.student.dashboard.PaperFilter;
import site.bzyl.island.viewmodel.student.dashboard.PaperInfo;
import site.bzyl.island.viewmodel.student.exam.ExamPaperPageVM;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface ExamPaperService extends BaseService<ExamPaper> {

    PageInfo<ExamPaper> page(ExamPaperPageRequestVM requestVM);

    PageInfo<ExamPaper> taskExamPage(ExamPaperPageRequestVM requestVM);

    PageInfo<ExamPaper> studentPage(ExamPaperPageVM requestVM);

    ExamPaper savePaperFromVM(ExamPaperEditRequestVM examPaperEditRequestVM, User user);

    ExamPaperEditRequestVM examPaperToVM(Integer id);

    List<PaperInfo> indexPaper(PaperFilter paperFilter);

    Integer selectAllCount();

    List<Integer> selectMothCount();
}
