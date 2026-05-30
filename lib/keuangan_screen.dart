import 'package:flutter/material.dart';
import 'beranda_screen.dart';
import 'presensi_screen.dart';
import 'profil_screen.dart';

class KeuanganScreen extends StatefulWidget {
  const KeuanganScreen({super.key});

  @override
  State<KeuanganScreen> createState() => _KeuanganScreenState();
}

class _KeuanganScreenState extends State<KeuanganScreen> {
  int _selectedNavIndex = 2;

  final List<Map<String, dynamic>> _transactions = [
    {
      'name': 'Ahmad Fathoni',
      'class': 'Kelas XII - Tahfidz',
      'amount': 'Rp 500.000',
      'status': 'Lunas',
      'date': '24 Mei 2024',
      'statusColor': const Color(0xFF10B981),
    },
    {
      'name': 'Zaid Al-Khair',
      'class': 'Kelas XII - Bahasa',
      'amount': 'Rp 500.000',
      'status': 'Menunggak',
      'date': '20 Mei 2024',
      'statusColor': const Color(0xFFEF4444),
    },
    {
      'name': 'Luqman Hakim',
      'class': 'Kelas XI - IPA',
      'amount': 'Rp 500.000',
      'status': 'Lunas',
      'date': '22 Mei 2024',
      'statusColor': const Color(0xFF10B981),
    },
    {
      'name': 'Maryam Azzahra',
      'class': 'Kelas X - Umum',
      'amount': 'Rp 500.000',
      'status': 'Sebagian',
      'date': '21 Mei 2024',
      'statusColor': const Color(0xFFF59E0B),
    },
  ];

  @override
  Widget build(BuildContext context) {
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
            const Text('PondokKu',
                style: TextStyle(
                    color: Color(0xFF1F2937),
                    fontSize: 18,
                    fontWeight: FontWeight.w700)),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            // Header
            const Text('Keuangan',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1F2937))),
            const SizedBox(height: 4),
            const Text('Bulan Mei 2024',
                style: TextStyle(fontSize: 13, color: Color(0xFF9CA3AF))),
            const SizedBox(height: 16),

            // Summary row
            Row(
              children: [
                _statCard('Total Tagihan', 'Rp 2.0M',
                    const Color(0xFF374151), Colors.white),
                const SizedBox(width: 12),
                _statCard('Terkumpul', 'Rp 1.5M',
                    Colors.white, const Color(0xFF1F2937),
                    border: true),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _statCard('Lunas', '3 Santri',
                    const Color(0xFFECFDF5), const Color(0xFF10B981)),
                const SizedBox(width: 12),
                _statCard('Menunggak', '1 Santri',
                    const Color(0xFFFEF2F2), const Color(0xFFEF4444)),
              ],
            ),

            const SizedBox(height: 24),

            // Transaction list
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Riwayat Pembayaran',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF1F2937))),
                GestureDetector(
                  onTap: () {},
                  child: const Text('Lihat Semua',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF6B7280))),
                ),
              ],
            ),
            const SizedBox(height: 12),

            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _transactions.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final t = _transactions[index];
                return Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF3F4F6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.receipt_long_outlined,
                            size: 22, color: Color(0xFF6B7280)),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(t['name'] as String,
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF1F2937))),
                            const SizedBox(height: 2),
                            Text('${t['class']} • ${t['date']}',
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF9CA3AF))),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(t['amount'] as String,
                              style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF1F2937))),
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: (t['statusColor'] as Color)
                                  .withOpacity(0.12),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(t['status'] as String,
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: t['statusColor'] as Color)),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _statCard(String title, String value, Color bg, Color textColor,
      {bool border = false}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(14),
          border: border
              ? Border.all(color: const Color(0xFFE5E7EB))
              : null,
          boxShadow: border
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  )
                ]
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(
                    fontSize: 12,
                    color: textColor.withOpacity(0.7),
                    fontWeight: FontWeight.w500)),
            const SizedBox(height: 6),
            Text(value,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: textColor)),
          ],
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
              _navItem(Icons.fingerprint, 'Presensi', 1),
              _navItemActive(Icons.account_balance_wallet_outlined, 'Keuangan'),
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
        } else if (index == 1) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (_) => const PresensiScreen()));
        } else if (index == 3) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (_) => const ProfilScreen()));
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
        Text(label,
            style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Color(0xFF4B5563))),
      ],
    );
  }
}
