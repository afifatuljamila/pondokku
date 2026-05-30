import 'package:flutter/material.dart';

class DaftarSantriScreen extends StatefulWidget {
  const DaftarSantriScreen({super.key});

  @override
  State<DaftarSantriScreen> createState() => _DaftarSantriScreenState();
}

class _DaftarSantriScreenState extends State<DaftarSantriScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final _namaController = TextEditingController();
  final _nisController = TextEditingController();
  final _ttlController = TextEditingController();
  final _namaWaliController = TextEditingController();
  final _noHpWaliController = TextEditingController();
  final _alamatController = TextEditingController();

  String? _selectedKelas;
  String? _selectedJurusan;
  String? _selectedJenisKelamin;
  bool _isLoading = false;

  final List<String> _kelasList = ['Kelas X', 'Kelas XI', 'Kelas XII'];
  final List<String> _jurusanList = ['Tahfidz', 'Bahasa', 'IPA', 'IPS'];
  final List<String> _jenisKelaminList = ['Laki-laki', 'Perempuan'];

  @override
  void dispose() {
    _namaController.dispose();
    _nisController.dispose();
    _ttlController.dispose();
    _namaWaliController.dispose();
    _noHpWaliController.dispose();
    _alamatController.dispose();
    super.dispose();
  }

  void _pilihTanggalLahir() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2005),
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF535763),
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Color(0xFF1F2937),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      final formatted =
          '${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}';
      setState(() => _ttlController.text = formatted);
    }
  }

  void _simpanDaftar() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() => _isLoading = false);

    if (!mounted) return;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: const EdgeInsets.all(28),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: const BoxDecoration(
                color: Color(0xFFDCFCE7),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check_rounded,
                  size: 40, color: Color(0xFF16A34A)),
            ),
            const SizedBox(height: 20),
            const Text(
              'Pendaftaran Berhasil!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1F2937),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Santri ${_namaController.text} telah berhasil didaftarkan ke sistem PondokKu.',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF6B7280),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(ctx);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF535763),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                ),
                child: const Text(
                  'Kembali ke Beranda',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9FAFB),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              size: 20, color: Color(0xFF374151)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Pendaftaran Santri',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Color(0xFF1F2937),
          ),
        ),
        centerTitle: false,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Avatar Placeholder ───────────────────────────────────────
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE5E7EB),
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: const Color(0xFFD1D5DB), width: 2),
                      ),
                      child: const Icon(Icons.person_rounded,
                          size: 52, color: Color(0xFF9CA3AF)),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: const BoxDecoration(
                          color: Color(0xFF535763),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.camera_alt_rounded,
                            size: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              const Center(
                child: Text(
                  'Foto Santri (opsional)',
                  style: TextStyle(fontSize: 12, color: Color(0xFF9CA3AF)),
                ),
              ),

              const SizedBox(height: 24),

              // ── DATA PRIBADI ─────────────────────────────────────────────
              _buildSectionHeader('Data Pribadi', Icons.person_outline_rounded),
              const SizedBox(height: 12),

              _buildTextField(
                id: 'field_nama',
                label: 'Nama Lengkap',
                hint: 'Masukkan nama lengkap santri',
                controller: _namaController,
                icon: Icons.badge_outlined,
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Nama tidak boleh kosong' : null,
              ),
              const SizedBox(height: 12),

              _buildTextField(
                id: 'field_nis',
                label: 'NIS (Nomor Induk Santri)',
                hint: 'Contoh: 2024001',
                controller: _nisController,
                icon: Icons.numbers_rounded,
                keyboardType: TextInputType.number,
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'NIS tidak boleh kosong' : null,
              ),
              const SizedBox(height: 12),

              _buildDropdown(
                id: 'dropdown_jk',
                label: 'Jenis Kelamin',
                hint: 'Pilih jenis kelamin',
                icon: Icons.wc_rounded,
                value: _selectedJenisKelamin,
                items: _jenisKelaminList,
                onChanged: (v) => setState(() => _selectedJenisKelamin = v),
                validator: (v) => v == null ? 'Pilih jenis kelamin' : null,
              ),
              const SizedBox(height: 12),

              _buildTextFieldTap(
                id: 'field_ttl',
                label: 'Tanggal Lahir',
                hint: 'DD/MM/YYYY',
                controller: _ttlController,
                icon: Icons.calendar_today_outlined,
                onTap: _pilihTanggalLahir,
                validator: (v) => (v == null || v.isEmpty)
                    ? 'Tanggal lahir tidak boleh kosong'
                    : null,
              ),

              const SizedBox(height: 24),

              // ── DATA KELAS ───────────────────────────────────────────────
              _buildSectionHeader('Data Kelas', Icons.school_outlined),
              const SizedBox(height: 12),

              _buildDropdown(
                id: 'dropdown_kelas',
                label: 'Kelas',
                hint: 'Pilih kelas',
                icon: Icons.class_outlined,
                value: _selectedKelas,
                items: _kelasList,
                onChanged: (v) => setState(() => _selectedKelas = v),
                validator: (v) => v == null ? 'Pilih kelas' : null,
              ),
              const SizedBox(height: 12),

              _buildDropdown(
                id: 'dropdown_jurusan',
                label: 'Jurusan / Program',
                hint: 'Pilih jurusan',
                icon: Icons.menu_book_outlined,
                value: _selectedJurusan,
                items: _jurusanList,
                onChanged: (v) => setState(() => _selectedJurusan = v),
                validator: (v) => v == null ? 'Pilih jurusan' : null,
              ),

              const SizedBox(height: 24),

              // ── DATA WALI ────────────────────────────────────────────────
              _buildSectionHeader('Data Wali Santri', Icons.family_restroom_rounded),
              const SizedBox(height: 12),

              _buildTextField(
                id: 'field_nama_wali',
                label: 'Nama Wali',
                hint: 'Masukkan nama orang tua / wali',
                controller: _namaWaliController,
                icon: Icons.person_2_outlined,
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Nama wali tidak boleh kosong' : null,
              ),
              const SizedBox(height: 12),

              _buildTextField(
                id: 'field_hp_wali',
                label: 'No. HP Wali',
                hint: 'Contoh: 08123456789',
                controller: _noHpWaliController,
                icon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
                validator: (v) {
                  if (v == null || v.trim().isEmpty) return 'No. HP tidak boleh kosong';
                  if (v.length < 10) return 'No. HP minimal 10 digit';
                  return null;
                },
              ),
              const SizedBox(height: 12),

              _buildTextField(
                id: 'field_alamat',
                label: 'Alamat Lengkap',
                hint: 'Masukkan alamat rumah santri',
                controller: _alamatController,
                icon: Icons.location_on_outlined,
                maxLines: 3,
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),

      // ── Tombol Daftar ────────────────────────────────────────────────────
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
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
          onPressed: _isLoading ? null : _simpanDaftar,
          icon: _isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : const Icon(Icons.person_add_alt_1_rounded,
                  color: Colors.white, size: 22),
          label: Text(
            _isLoading ? 'Menyimpan...' : 'Daftarkan Santri',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF374151),
            minimumSize: const Size(double.infinity, 54),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            elevation: 0,
          ),
        ),
      ),
    );
  }

  // ─── Section Header ─────────────────────────────────────────────────────────
  Widget _buildSectionHeader(String title, IconData icon) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: const Color(0xFF535763).withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 18, color: const Color(0xFF535763)),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1F2937),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            height: 1,
            color: const Color(0xFFE5E7EB),
          ),
        ),
      ],
    );
  }

  // ─── Text Field ─────────────────────────────────────────────────────────────
  Widget _buildTextField({
    required String id,
    required String label,
    required String hint,
    required TextEditingController controller,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF374151))),
        const SizedBox(height: 6),
        TextFormField(
          key: Key(id),
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          validator: validator,
          style: const TextStyle(fontSize: 14, color: Color(0xFF1F2937)),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle:
                const TextStyle(color: Color(0xFF9CA3AF), fontSize: 14),
            prefixIcon: maxLines == 1
                ? Icon(icon, size: 20, color: const Color(0xFF9CA3AF))
                : null,
            prefixText: maxLines > 1 ? '' : null,
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(
                horizontal: 16, vertical: maxLines > 1 ? 14 : 0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  const BorderSide(color: Color(0xFF535763), width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  const BorderSide(color: Color(0xFFDC2626), width: 1.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  const BorderSide(color: Color(0xFFDC2626), width: 1.5),
            ),
          ),
        ),
      ],
    );
  }

  // ─── Text Field Tap (untuk DatePicker) ──────────────────────────────────────
  Widget _buildTextFieldTap({
    required String id,
    required String label,
    required String hint,
    required TextEditingController controller,
    required IconData icon,
    required VoidCallback onTap,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF374151))),
        const SizedBox(height: 6),
        TextFormField(
          key: Key(id),
          controller: controller,
          readOnly: true,
          onTap: onTap,
          validator: validator,
          style: const TextStyle(fontSize: 14, color: Color(0xFF1F2937)),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle:
                const TextStyle(color: Color(0xFF9CA3AF), fontSize: 14),
            prefixIcon:
                Icon(icon, size: 20, color: const Color(0xFF9CA3AF)),
            suffixIcon: const Icon(Icons.arrow_drop_down_rounded,
                color: Color(0xFF9CA3AF)),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.zero,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  const BorderSide(color: Color(0xFF535763), width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  const BorderSide(color: Color(0xFFDC2626), width: 1.5),
            ),
          ),
        ),
      ],
    );
  }

  // ─── Dropdown ────────────────────────────────────────────────────────────────
  Widget _buildDropdown({
    required String id,
    required String label,
    required String hint,
    required IconData icon,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF374151))),
        const SizedBox(height: 6),
        DropdownButtonFormField<String>(
          key: Key(id),
          value: value,
          onChanged: onChanged,
          validator: validator,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, size: 20, color: const Color(0xFF9CA3AF)),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.zero,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  const BorderSide(color: Color(0xFF535763), width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  const BorderSide(color: Color(0xFFDC2626), width: 1.5),
            ),
          ),
          hint: Text(hint,
              style: const TextStyle(
                  color: Color(0xFF9CA3AF), fontSize: 14)),
          style:
              const TextStyle(fontSize: 14, color: Color(0xFF1F2937)),
          icon: const Icon(Icons.keyboard_arrow_down_rounded,
              color: Color(0xFF9CA3AF)),
          isExpanded: true,
          items: items
              .map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
