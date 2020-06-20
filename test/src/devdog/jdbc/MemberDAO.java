package devdog.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import devdog.DB;

public class MemberDAO {

    public static List<Member> findAll() throws Exception {
        String sql = "SELECT * FROM student";
        try (Connection connection = DB.getConnection("devdog");
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
            ArrayList<Member> list = new ArrayList<Member>();
            while (resultSet.next()) {
                Member member = new Member();
                member.setId(resultSet.getInt("id"));
                member.setStudentID(resultSet.getInt("studentID"));
                member.setName(resultSet.getString("name"));
                member.setBirth(resultSet.getString("birth"));
                list.add(member);
            }
            return list;
        }
    }
}
