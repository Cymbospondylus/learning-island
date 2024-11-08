package site.bzyl.island.service.impl;

import site.bzyl.island.domain.ExamPaper;
import site.bzyl.island.domain.ExamPaperAnswer;
import site.bzyl.island.domain.TaskExamCustomerAnswer;
import site.bzyl.island.domain.TextContent;
import site.bzyl.island.domain.task.TaskItemAnswerObject;
import site.bzyl.island.repository.TaskExamCustomerAnswerMapper;
import site.bzyl.island.service.TaskExamCustomerAnswerService;
import site.bzyl.island.service.TextContentService;
import site.bzyl.island.utility.JsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Service
public class TaskExamCustomerAnswerImpl extends BaseServiceImpl<TaskExamCustomerAnswer> implements TaskExamCustomerAnswerService {

    private final TaskExamCustomerAnswerMapper taskExamCustomerAnswerMapper;
    private final TextContentService textContentService;

    @Autowired
    public TaskExamCustomerAnswerImpl(TaskExamCustomerAnswerMapper taskExamCustomerAnswerMapper, TextContentService textContentService) {
        super(taskExamCustomerAnswerMapper);
        this.taskExamCustomerAnswerMapper = taskExamCustomerAnswerMapper;
        this.textContentService = textContentService;
    }

    @Override
    public void insertOrUpdate(ExamPaper examPaper, ExamPaperAnswer examPaperAnswer, Date now) {
        Integer taskId = examPaper.getTaskExamId();
        Integer userId = examPaperAnswer.getCreateUser();
        TaskExamCustomerAnswer taskExamCustomerAnswer = taskExamCustomerAnswerMapper.getByTUid(taskId, userId);
        if (null == taskExamCustomerAnswer) {
            taskExamCustomerAnswer = new TaskExamCustomerAnswer();
            taskExamCustomerAnswer.setCreateTime(now);
            taskExamCustomerAnswer.setCreateUser(userId);
            taskExamCustomerAnswer.setTaskExamId(taskId);
            List<TaskItemAnswerObject> taskItemAnswerObjects = Arrays.asList(new TaskItemAnswerObject(examPaperAnswer.getExamPaperId(), examPaperAnswer.getId(), examPaperAnswer.getStatus()));
            TextContent textContent = textContentService.jsonConvertInsert(taskItemAnswerObjects, now, null);
            textContentService.insertByFilter(textContent);
            taskExamCustomerAnswer.setTextContentId(textContent.getId());
            insertByFilter(taskExamCustomerAnswer);
        } else {
            TextContent textContent = textContentService.selectById(taskExamCustomerAnswer.getTextContentId());
            List<TaskItemAnswerObject> taskItemAnswerObjects = JsonUtil.toJsonListObject(textContent.getContent(), TaskItemAnswerObject.class);
            taskItemAnswerObjects.add(new TaskItemAnswerObject(examPaperAnswer.getExamPaperId(), examPaperAnswer.getId(), examPaperAnswer.getStatus()));
            textContentService.jsonConvertUpdate(textContent, taskItemAnswerObjects, null);
            textContentService.updateByIdFilter(textContent);
        }
    }

    @Override
    public TaskExamCustomerAnswer selectByTUid(Integer tid, Integer uid) {
        return taskExamCustomerAnswerMapper.getByTUid(tid, uid);
    }

    @Override
    public List<TaskExamCustomerAnswer> selectByTUid(List<Integer> taskIds, Integer uid) {
        return taskExamCustomerAnswerMapper.selectByTUid(taskIds, uid);
    }
}
