import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 8, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Company Updates',
          style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(14),
            ),
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicator: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),

              ),
              tabs: const [
                Tab(text: 'Announcements'),
                Tab(text: 'Holidays'),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildAnnouncementsTab(),
          _buildHolidaysTab(),
        ],
      ),
    );
  }

  // ----------------- Announcements Tab -----------------
  Widget _buildAnnouncementsTab() {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        _buildAnnouncementCard(
          title: 'Quarterly Results Announcement',
          date: '20 Jun 2023',
          description: 'We’re pleased to announce that our company has exceeded its quarterly targets by 15%. Thank you all for your hard work and dedication.',
          isNew: true,
          icon: Icons.notifications,
        ),
        _buildAnnouncementCard(
          title: 'Office Wi-Fi Maintenance',
          date: '18 Jun 2023',
          isNew: true,
          icon: Icons.wifi,
        ),
        _buildAnnouncementCard(
          title: 'Annual Team Outing',
          date: '15 Jun 2023',
          icon: Icons.event,
        ),
        _buildAnnouncementCard(
          title: 'New Health Insurance Policy',
          date: '10 Jun 2023',
          icon: Icons.health_and_safety,
        ),
        _buildAnnouncementCard(
          title: 'Employee Satisfaction Survey',
          date: '5 Jun 2023',
          icon: Icons.feedback,
        ),
      ],
    );
  }

  Widget _buildAnnouncementCard({
    required String title,
    required String date,
    String? description,
    bool isNew = false,
    required IconData icon,
  }) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: ExpansionTile(
        leading: Icon(icon, color: Colors.teal),
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.normal)),
        subtitle: Row(
          children: [
            Text(date, style: const TextStyle(color: Colors.grey)),
            if (isNew)
              Container(
                margin: const EdgeInsets.only(left: 8),
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.teal.shade100,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Text(
                  'New',
                  style: TextStyle(color: Colors.teal, fontSize: 12),
                ),
              ),
          ],
        ),
        children: description != null
            ? [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            child: Text(description, style: const TextStyle(color: Colors.grey)),
          )
        ]
            : [],
      ),
    );
  }

  // ----------------- Holidays Tab -----------------
  Widget _buildHolidaysTab() {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        // Upcoming Holidays Card
        Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Upcoming Holidays',
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 8),
                _buildHolidayCard(title: 'Independence Day', date: '15 Aug 2023'),
                _buildHolidayCard(title: 'Gandhi Jayanti', date: '2 Oct 2023'),
                _buildHolidayCard(title: 'Diwali', date: '12 Nov 2023'),
                _buildHolidayCard(title: 'Christmas', date: '25 Dec 2023'),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),

        // Past Holidays Card
        Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Past Holidays',
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 8),
                _buildHolidayCard(title: 'Republic Day', date: '26 Jan 2023'),
                _buildHolidayCard(title: 'Holi', date: '8 Mar 2023'),
                _buildHolidayCard(title: 'Good Friday', date: '7 Apr 2023'),
                _buildHolidayCard(title: 'Labor Day', date: '1 May 2023'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHolidayCard({required String title, required String date}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // ✅ Align date to right side
        children: [
          Row(
            children: [
              const Icon(Icons.calendar_today, color: Colors.amber),
              const SizedBox(width: 12),
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.normal),
              ),
            ],
          ),
          Text(
            date,
            style: const TextStyle(color: Colors.grey), // ✅ Date on right side
          ),
        ],
      ),
    );
  }
}
