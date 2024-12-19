package site.bzyl.dao;

public class UserDaoImpl implements UserDao {

    private String username;
    private String password;

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public UserDaoImpl() {
        System.out.println("userDaoImpl创建...");
    }

    @Override
    public void add() {
        System.out.println("userDaoImpl.add()..." + username + "=" + password);
    }

    public String getPassword() {
        return password;
    }

    public String getUsername() {
        return username;
    }
}
