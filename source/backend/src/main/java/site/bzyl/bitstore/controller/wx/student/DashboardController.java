package site.bzyl.bitstore.controller.wx.student;

import site.bzyl.bitstore.base.RestResponse;
import site.bzyl.bitstore.controller.wx.BaseWXApiController;
import site.bzyl.bitstore.domain.TaskExam;
import site.bzyl.bitstore.domain.TaskExamCustomerAnswer;
import site.bzyl.bitstore.domain.TextContent;
import site.bzyl.bitstore.domain.User;
import site.bzyl.bitstore.domain.enums.ExamPaperTypeEnum;
import site.bzyl.bitstore.domain.task.TaskItemAnswerObject;
import site.bzyl.bitstore.domain.task.TaskItemObject;
import site.bzyl.bitstore.service.ExamPaperService;
import site.bzyl.bitstore.service.TaskExamCustomerAnswerService;
import site.bzyl.bitstore.service.TaskExamService;
import site.bzyl.bitstore.service.TextContentService;
import site.bzyl.bitstore.utility.DateTimeUtil;
import site.bzyl.bitstore.utility.JsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import site.bzyl.bitstore.viewmodel.student.dashboard.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;


@Controller("WXStudentDashboardController")
@RequestMapping(value = "/api/wx/student/dashboard")
@ResponseBody
public class DashboardController extends BaseWXApiController {

    private final ExamPaperService examPaperService;
    private final TextContentService textContentService;
    private final TaskExamService taskExamService;
    private final TaskExamCustomerAnswerService taskExamCustomerAnswerService;

    @Autowired
    public DashboardController(ExamPaperService examPaperService, TextContentService textContentService, TaskExamService taskExamService, TaskExamCustomerAnswerService taskExamCustomerAnswerService) {
        this.examPaperService = examPaperService;
        this.textContentService = textContentService;
        this.taskExamService = taskExamService;
        this.taskExamCustomerAnswerService = taskExamCustomerAnswerService;
    }

    @RequestMapping(value = "/index", method = RequestMethod.POST)
    public RestResponse<IndexVM> index() {
        IndexVM indexVM = new IndexVM();
        User user = getCurrentUser();

        PaperFilter fixedPaperFilter = new PaperFilter();
        fixedPaperFilter.setGradeLevel(user.getUserLevel());
        fixedPaperFilter.setExamPaperType(ExamPaperTypeEnum.Fixed.getCode());
        indexVM.setFixedPaper(examPaperService.indexPaper(fixedPaperFilter));

        PaperFilter timeLimitPaperFilter = new PaperFilter();
        timeLimitPaperFilter.setDateTime(new Date());
        timeLimitPaperFilter.setGradeLevel(user.getUserLevel());
        timeLimitPaperFilter.setExamPaperType(ExamPaperTypeEnum.TimeLimit.getCode());

        List<PaperInfo> limitPaper = examPaperService.indexPaper(timeLimitPaperFilter);
        List<PaperInfoVM> paperInfoVMS = limitPaper.stream().map(d -> {
            PaperInfoVM vm = modelMapper.map(d, PaperInfoVM.class);
            vm.setStartTime(DateTimeUtil.dateFormat(d.getLimitStartTime()));
            vm.setEndTime(DateTimeUtil.dateFormat(d.getLimitEndTime()));
            return vm;
        }).collect(Collectors.toList());
        indexVM.setTimeLimitPaper(paperInfoVMS);
        return RestResponse.ok(indexVM);
    }

    @RequestMapping(value = "/task", method = RequestMethod.POST)
    public RestResponse<List<TaskItemVm>> task() {
        User user = getCurrentUser();
        List<TaskExam> taskExams = taskExamService.getByGradeLevel(user.getUserLevel());
        if (taskExams.size() == 0) {
            return RestResponse.ok(new ArrayList<>());
        }
        List<Integer> tIds = taskExams.stream().map(taskExam -> taskExam.getId()).collect(Collectors.toList());
        List<TaskExamCustomerAnswer> taskExamCustomerAnswers = taskExamCustomerAnswerService.selectByTUid(tIds, user.getId());
        List<TaskItemVm> vm = taskExams.stream().map(t -> {
            TaskItemVm itemVm = new TaskItemVm();
            itemVm.setId(t.getId());
            itemVm.setTitle(t.getTitle());
            TaskExamCustomerAnswer taskExamCustomerAnswer = taskExamCustomerAnswers.stream()
                    .filter(tc -> tc.getTaskExamId().equals(t.getId())).findFirst().orElse(null);
            List<TaskItemPaperVm> paperItemVMS = getTaskItemPaperVm(t.getFrameTextContentId(), taskExamCustomerAnswer);
            itemVm.setPaperItems(paperItemVMS);
            return itemVm;
        }).collect(Collectors.toList());
        return RestResponse.ok(vm);
    }


    private List<TaskItemPaperVm> getTaskItemPaperVm(Integer tFrameId, TaskExamCustomerAnswer taskExamCustomerAnswers) {
        TextContent textContent = textContentService.selectById(tFrameId);
        List<TaskItemObject> paperItems = JsonUtil.toJsonListObject(textContent.getContent(), TaskItemObject.class);

        List<TaskItemAnswerObject> answerPaperItems = null;
        if (null != taskExamCustomerAnswers) {
            TextContent answerTextContent = textContentService.selectById(taskExamCustomerAnswers.getTextContentId());
            answerPaperItems = JsonUtil.toJsonListObject(answerTextContent.getContent(), TaskItemAnswerObject.class);
        }


        List<TaskItemAnswerObject> finalAnswerPaperItems = answerPaperItems;
        return paperItems.stream().map(p -> {
                    TaskItemPaperVm ivm = new TaskItemPaperVm();
                    ivm.setExamPaperId(p.getExamPaperId());
                    ivm.setExamPaperName(p.getExamPaperName());
                    if (null != finalAnswerPaperItems) {
                        finalAnswerPaperItems.stream()
                                .filter(a -> a.getExamPaperId().equals(p.getExamPaperId()))
                                .findFirst()
                                .ifPresent(a -> {
                                    ivm.setExamPaperAnswerId(a.getExamPaperAnswerId());
                                    ivm.setStatus(a.getStatus());
                                });
                    }
                    return ivm;
                }
        ).collect(Collectors.toList());
    }


}
