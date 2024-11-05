package site.bzyl.bitstore.service;

import site.bzyl.bitstore.domain.ExamPaper;
import site.bzyl.bitstore.domain.ExamPaperAnswer;
import site.bzyl.bitstore.domain.TaskExamCustomerAnswer;

import java.util.Date;
import java.util.List;

public interface TaskExamCustomerAnswerService extends BaseService<TaskExamCustomerAnswer> {

    void insertOrUpdate(ExamPaper examPaper, ExamPaperAnswer examPaperAnswer, Date now);

    TaskExamCustomerAnswer selectByTUid(Integer tid, Integer uid);

    List<TaskExamCustomerAnswer> selectByTUid(List<Integer> taskIds, Integer uid);
}
