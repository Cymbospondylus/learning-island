package site.bzyl.island.event;

import site.bzyl.island.domain.UserEventLog;
import org.springframework.context.ApplicationEvent;

/**
 * @version 3.5.0
 * @description:  The type User event.

 * @date  9:45
 */
public class UserEvent extends ApplicationEvent {

    private final UserEventLog userEventLog;

    /**
     * Instantiates a new User event.
     *
     * @param userEventLog the user event log
     */
    public UserEvent(final UserEventLog userEventLog) {
        super(userEventLog);
        this.userEventLog = userEventLog;
    }

    /**
     * Gets user event log.
     *
     * @return the user event log
     */
    public UserEventLog getUserEventLog() {
        return userEventLog;
    }
}
