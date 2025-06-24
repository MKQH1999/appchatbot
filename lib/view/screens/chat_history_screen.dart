import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:appchatbot/models/chat_session.dart';

class ChatHistoryScreen extends StatefulWidget {
  const ChatHistoryScreen({super.key});

  @override
  State<ChatHistoryScreen> createState() => _ChatHistoryScreenState();
}

class _ChatHistoryScreenState extends State<ChatHistoryScreen> {
  final List<ChatSession> _sessions = [
    ChatSession(
      id: '1',
      title: 'استفسار حول التطبيق',
      lastMessage: 'كيف يمكنني تغيير اللغة؟',
      date: DateTime.now().subtract(const Duration(hours: 2)),
      messageCount: 5,
    ),
    ChatSession(
      id: '2',
      title: 'دعم فني',
      lastMessage: 'لقد قمت بحل المشكلة، شكراً لك!',
      date: DateTime.now().subtract(const Duration(days: 1)),
      messageCount: 12,
    ),
    ChatSession(
      id: '3',
      title: 'استفسار عام',
      lastMessage: 'ما هي مميزات الإصدار الجديد؟',
      date: DateTime.now().subtract(const Duration(days: 3)),
      messageCount: 8,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('سجل المحادثات'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () => _showDeleteConfirmation(),
          ),
        ],
      ),
      body: _sessions.isEmpty
          ? _buildEmptyState()
          : ListView.builder(
              itemCount: _sessions.length,
              itemBuilder: (context, index) {
                final session = _sessions[index];
                return _buildSessionTile(session);
              },
            ),
    );
  }

  Widget _buildSessionTile(ChatSession session) {
    return ListTile(
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.blue.shade100,
          borderRadius: BorderRadius.circular(25),),
        child: const Icon(Icons.chat, color: Colors.blue),
      ),
      title: Text(session.title),
      subtitle: Text(session.lastMessage),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            DateFormat('hh:mm a').format(session.date),
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 4),
          if (session.messageCount > 0)
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                session.messageCount.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
        ],
      ),
      onTap: () => _openChatSession(session),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/empty_chat.png',
            width: 150,
            height: 150,
          ),
          const SizedBox(height: 20),
          const Text(
            'لا توجد محادثات سابقة',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'ابدأ محادثة جديدة مع المساعد الذكي',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('بدء محادثة جديدة'),
          ),
        ],
      ),
    );
  }

  void _openChatSession(ChatSession session) {
    // يمكنك استبدال هذا بالانتقال إلى صفحة المحادثة مع تحميل الجلسة
    Navigator.pushNamed(context, '/home');
  }

  void _showDeleteConfirmation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('حذف جميع المحادثات'),
        content: const Text('هل أنت متأكد أنك تريد حذف سجل المحادثات بالكامل؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _sessions.clear();
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('تم حذف سجل المحادثات')),
              );
            },
            child: const Text('حذف', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}

class ChatSession {
  final String id;
  final String title;
  final String lastMessage;
  final DateTime date;
  final int messageCount;

  ChatSession({
    required this.id,
    required this.title,
    required this.lastMessage,
    required this.date,
    required this.messageCount,
  });
}