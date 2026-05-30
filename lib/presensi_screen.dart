import 'package:flutter/material.dart';
import 'beranda_screen.dart';
import 'keuangan_screen.dart';
import 'profil_screen.dart';

class PresensiScreen extends StatefulWidget {
  const PresensiScreen({super.key});

  @override
  State<PresensiScreen> createState() => _PresensiScreenState();
}

class _PresensiScreenState extends State<PresensiScreen> {
  int _selectedDateIndex = 4; // JUM 24
  String _searchQuery = '';
  int _selectedNavIndex = 1;

  final List<Map<String, dynamic>> _students = [
    {
      'name': 'Ahmad Fathoni',
      'class': 'Kelas XII - Tahfidz',
      'status': 'Hadir',
      'initials': 'AF',
      'avatarColor': const Color(0xFF94A3B8),
    },
    {
      'name': 'Zaid Al-Khair',
      'class': 'Kelas XII - Bahasa',
      'status': 'Izin',
      'initials': 'ZA',
      'avatarColor': const Color(0xFF6EE7B7),
    },
    {
      'name': 'Luqman Hakim',
      'class': 'Kelas XI - IPA',
      'status': null,
      'initials': 'LH',
      'avatarColor': const Color(0xFF34D399),
    },
    {
      'name': 'Bilal Musa',
      'class': 'Kelas X - Tahfidz',
      'status': 'Hadir',
      'initials': 'BM',
      'avatarColor': const Color(0xFF60A5FA),
    },
    {
      'name': 'Ridwan Syafi\'i',
      'class': 'Kelas XI - Bahasa',
      'status': null,
      'initials': 'RS',
      'avatarColor': const Color(0xFFA78BFA),
    },
    {
      'name': 'Faqih Abdurrahman',
      'class': 'Kelas XII - IPA',
      'status': 'Hadir',
      'initials': 'FA',
      'avatarColor': const Color(0xFFF97316),
    },
    {
      'name': 'Hafizh Nurrohim',
      'class': 'Kelas X - Tahfidz',
      'status': null,
      'initials': 'HN',
      'avatarColor': const Color(0xFF14B8A6),
    },
    {
      'name': 'Ihsan Al-Farisi',
      'class': 'Kelas XI - IPS',
      'status': 'Sakit',
      'initials': 'IA',
      'avatarColor': const Color(0xFFEC4899),
    },
    {
      'name': 'Jabir Umar',
      'class': 'Kelas X - Bahasa',
      'status': 'Hadir',
      'initials': 'JU',
      'avatarColor': const Color(0xFF8B5CF6),
    },
    {
      'name': 'Khalid Mustofa',
      'class': 'Kelas XII - Tahfidz',
      'status': null,
      'initials': 'KM',
      'avatarColor': const Color(0xFF22D3EE),
    },
    {
      'name': 'Luthfi Hasbullah',
      'class': 'Kelas XI - Tahfidz',
      'status': 'Hadir',
      'initials': 'LB',
      'avatarColor': const Color(0xFFFBBF24),
    },
    {
      'name': 'Muhammad Farhan',
      'class': 'Kelas X - IPA',
      'status': null,
      'initials': 'MF',
      'avatarColor': const Color(0xFF4ADE80),
    },
  ];

  List<Map<String, dynamic>> get _filteredStudents {
    if (_searchQuery.isEmpty) return _students;
    return _students
        .where((s) => s['name']
            .toString()
            .toLowerCase()
            .contains(_searchQuery.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final int hadir = _students.where((s) => s['status'] == 'Hadir').length;
    final int izin  = _students.where((s) => s['status'] == 'Izin').length;
    final int sakit = _students.where((s) => s['status'] == 'Sakit').length;
    final int alpa  = _students.where((s) => s['status'] == 'Alpa').length;

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9FAFB),
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 16,
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xFF6B7280),
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Text('AJ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700)),
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'PondokKu',
              style: TextStyle(
                color: Color(0xFF1F2937),
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined,
                color: Color(0xFF4B5563), size: 26),
            onPressed: () {},
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Header ────────────────────────────────────────────────
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Presensi Harian',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.calendar_month_outlined,
                              size: 16, color: Color(0xFF6B7280)),
                          const SizedBox(width: 4),
                          const Text(
                            '24 Mei 2024',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF6B7280),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // ── Date Picker ───────────────────────────────────────────
                SizedBox(
                  height: 76,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      final bool isSelected = index == _selectedDateIndex;
                      final int date = 20 + index;
                      const List<String> days = [
                        'SEN', 'SEL', 'RAB', 'KAM', 'JUM', 'SAB', 'MIN'
                      ];
                      return GestureDetector(
                        onTap: () =>
                            setState(() => _selectedDateIndex = index),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: 56,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 4),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xFF4B5563)
                                : const Color(0xFFE5E7EB),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                days[index],
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: isSelected
                                      ? Colors.white70
                                      : const Color(0xFF6B7280),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '$date',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: isSelected
                                      ? Colors.white
                                      : const Color(0xFF1F2937),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 12),

                // ── Search Bar ────────────────────────────────────────────
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    onChanged: (v) => setState(() => _searchQuery = v),
                    style: const TextStyle(
                        fontSize: 14, color: Color(0xFF1F2937)),
                    decoration: InputDecoration(
                      hintText: 'Cari nama santri...',
                      hintStyle: const TextStyle(
                          color: Color(0xFF9CA3AF), fontSize: 14),
                      prefixIcon: const Icon(Icons.search,
                          color: Color(0xFF9CA3AF), size: 20),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide:
                            const BorderSide(color: Color(0xFFE5E7EB)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide:
                            const BorderSide(color: Color(0xFFE5E7EB)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(
                            color: Color(0xFF6B7280), width: 1.5),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // ── Summary Cards ─────────────────────────────────────────
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      _buildSummaryCard('HADIR', '$hadir',
                          bgColor: const Color(0xFF535763),
                          textColor: Colors.white),
                      const SizedBox(width: 8),
                      _buildSummaryCard('IZIN', '$izin',
                          bgColor: const Color(0xFFE5E7EB),
                          textColor: const Color(0xFF4B5563)),
                      const SizedBox(width: 8),
                      _buildSummaryCard('SAKIT', '$sakit',
                          bgColor: const Color(0xFFE5E7EB),
                          textColor: const Color(0xFF4B5563)),
                      const SizedBox(width: 8),
                      _buildSummaryCard('ALPA', '$alpa',
                          bgColor: const Color(0xFFFEF2F2),
                          textColor: const Color(0xFFDC2626),
                          leftBorderColor: const Color(0xFFDC2626)),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // ── Student Cards ─────────────────────────────────────────
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: _filteredStudents.length,
                  itemBuilder: (context, index) {
                    final student = _filteredStudents[index];
                    final originalIndex = _students.indexOf(student);
                    return _buildStudentCard(student, originalIndex);
                  },
                ),
              ],
            ),
          ),

          // ── Simpan Presensi Button ────────────────────────────────────
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
              decoration: BoxDecoration(
                color: const Color(0xFFF9FAFB),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 12,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      title: const Text('Presensi Tersimpan! ✅',
                          style: TextStyle(fontWeight: FontWeight.w700)),
                      content: const Text(
                          'Data presensi harian berhasil disimpan ke sistem.'),
                      actions: [
                        ElevatedButton(
                          onPressed: () => Navigator.pop(ctx),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF535763),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: const Text('OK',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.save_outlined,
                    color: Colors.white, size: 20),
                label: const Text(
                  'Simpan Presensi',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4B5563),
                  minimumSize: const Size(double.infinity, 52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 0,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildSummaryCard(
    String title,
    String count, {
    required Color bgColor,
    required Color textColor,
    Color? leftBorderColor,
  }) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: bgColor,
            border: leftBorderColor != null
                ? Border(
                    left:
                        BorderSide(color: leftBorderColor, width: 3.5))
                : null,
            borderRadius:
                leftBorderColor != null ? null : BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Text(title,
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: textColor,
                      letterSpacing: 0.5)),
              const SizedBox(height: 4),
              Text(count,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: textColor)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStudentCard(Map<String, dynamic> student, int originalIndex) {
    final bool isHighlighted = originalIndex == 1;
    final bool isCompleted = student['status'] != null;
    final Color avatarColor = student['avatarColor'] as Color;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (isHighlighted)
                Container(width: 4, color: const Color(0xFF535763)),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: avatarColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                student['initials'] as String,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(student['name'] as String,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF1F2937))),
                                const SizedBox(height: 2),
                                Text(student['class'] as String,
                                    style: const TextStyle(
                                        fontSize: 13,
                                        color: Color(0xFF6B7280))),
                              ],
                            ),
                          ),
                          if (isCompleted)
                            const Icon(Icons.check_circle_outline_rounded,
                                color: Color(0xFF6B7280), size: 22),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          _statusBtn('Hadir', student, 'Hadir'),
                          const SizedBox(width: 8),
                          _statusBtn('Izin', student, 'Izin'),
                          const SizedBox(width: 8),
                          _statusBtn('Sakit', student, 'Sakit'),
                          const SizedBox(width: 8),
                          _statusBtn('Alpa', student, 'Alpa'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statusBtn(
      String label, Map<String, dynamic> student, String value) {
    final bool isActive = student['status'] == value;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => student['status'] = value),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(vertical: 9),
          decoration: BoxDecoration(
            color: isActive
                ? const Color(0xFF535763)
                : const Color(0xFFF3F4F6),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(label,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: isActive
                        ? FontWeight.w700
                        : FontWeight.w500,
                    color: isActive
                        ? Colors.white
                        : const Color(0xFF4B5563))),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _navItem(Icons.grid_view_rounded, 'Beranda', 0),
              _navItemActive(Icons.fingerprint, 'Presensi'),
              _navItem(
                  Icons.account_balance_wallet_outlined, 'Keuangan', 2),
              _navItem(Icons.person_outline_rounded, 'Profil', 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () {
        if (index == 0) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (_) => const BerandaScreen()));
        } else if (index == 2) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (_) => const KeuanganScreen()));
        } else if (index == 3) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (_) => const ProfilScreen()));
        } else {
          setState(() => _selectedNavIndex = index);
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 24, color: const Color(0xFF9CA3AF)),
          const SizedBox(height: 4),
          Text(label,
              style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF9CA3AF))),
        ],
      ),
    );
  }

  Widget _navItemActive(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF535763),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(icon, size: 24, color: Colors.white),
        ),
        const SizedBox(height: 4),
        const Text('Presensi',
            style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Color(0xFF4B5563))),
      ],
    );
  }
}
