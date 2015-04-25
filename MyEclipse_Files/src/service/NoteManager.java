package service;

import java.util.List;

import pojo.Msg;
import pojo.Note;
import dao.NoteDao;

public class NoteManager {
	private NoteDao nd = new NoteDao();
	public List<Note> listAllNote(){ //列出所有公告，按时间降序排列
		return nd.listAllNote();
	}
	public int addNewNote(Note msg) {//添加新的公告
		return nd.addNewNote(msg);
	}
	public int deleteNote(int nid){//删除公告
		return nd.deleteNote(nid);
	}
	public Note listLastNote(){ //查找最新公告
		return nd.listLastNote();
	}
}
