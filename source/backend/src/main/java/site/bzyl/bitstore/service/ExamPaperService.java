package site.bzyl.bitstore.service;

import site.bzyl.bitstore.domain.ExamPaper;
import site.bzyl.bitstore.domain.User;
import site.bzyl.bitstore.viewmodel.admin.exam.ExamPaperEditRequestVM;
import site.bzyl.bitstore.viewmodel.admin.exam.ExamPaperPageRequestVM;
import site.bzyl.bitstore.viewmodel.student.dashboard.PaperFilter;
import site.bzyl.bitstore.viewmodel.student.dashboard.PaperInfo;
import site.bzyl.bitstore.viewmodel.student.exam.ExamPaperPageVM;
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
