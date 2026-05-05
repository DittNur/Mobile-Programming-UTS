import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: RadiobuttonPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class RadiobuttonPage extends StatefulWidget {
  const RadiobuttonPage({super.key});

  @override
  State<RadiobuttonPage> createState() => _RadiobuttonPageState();
}

class _RadiobuttonPageState extends State<RadiobuttonPage> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _umurController = TextEditingController();

  String? _selectedGender;
  String? _selectedJob;
  String? _selectedWorkType;

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  final List<Map<String, dynamic>> _jobOptions = [
    {'value': 'Admin', 'icon': Icons.support_agent, 'color': const Color(0xFF2196F3), 'description': 'Mengelola Data'},
    {'value': 'Guru', 'icon': Icons.school, 'color': const Color(0xFF9C27B0), 'description': 'Mendidik Generasi'},
    {'value': 'Programer', 'icon': Icons.code, 'color': const Color(0xFF4CAF50), 'description': 'Mengembangkan Software'},
    {'value': 'Pengusaha', 'icon': Icons.business, 'color': const Color(0xFFF44336), 'description': 'Mengelola Bisnis'},
    {'value': 'Desainer', 'icon': Icons.design_services, 'color': const Color(0xFF00BCD4), 'description': 'Kreativitas Visual'},
  ];

  final List<Map<String, dynamic>> _workTypeOptions = [
    {
      'value': 'Full Time',
      'subtitle': 'Bekerja 40 jam/minggu',
      'icon': Icons.work,
      'color': const Color(0xFF00897B),
      'benefits': ['Asuransi kesehatan', 'Tunjangan hari raya']
    },
    {
      'value': 'Part Time',
      'subtitle': 'Bekerja < 40 jam/minggu',
      'icon': Icons.access_time,
      'color': const Color(0xFF0288D1),
      'benefits': ['Jadwal fleksibel', 'Liburan panjang']
    },
    {
      'value': 'Freelance',
      'subtitle': 'Pekerja lepas',
      'icon': Icons.laptop,
      'color': const Color(0xFF7B1FA2),
      'benefits': ['Kerja remote', 'Rate per project']
    },
    {
      'value': 'Kontrak',
      'subtitle': 'Perjanjian waktu tertentu',
      'icon': Icons.description,
      'color': const Color(0xFFE65100),
      'benefits': ['Bonus kontrak', 'Evaluasi berkala']
    },
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _namaController.dispose();
    _umurController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF00695C), Color(0xFF00897B)],
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(Icons.check_circle, color: Colors.white, size: 28),
              ),
              const SizedBox(width: 12),
              const Text('Pendaftaran Berhasil!', 
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ],
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(),
                const SizedBox(height: 12),
                _buildModernInfoRow(Icons.person, 'Nama Lengkap', _namaController.text),
                const SizedBox(height: 10),
                _buildModernInfoRow(Icons.cake, 'Umur', '${_umurController.text} tahun'),
                const SizedBox(height: 10),
                _buildModernInfoRow(Icons.people, 'Jenis Kelamin', _selectedGender ?? '-'),
                const SizedBox(height: 10),
                _buildModernInfoRow(Icons.work, 'Pekerjaan', _selectedJob ?? '-'),
                const SizedBox(height: 10),
                _buildModernInfoRow(Icons.business_center, 'Tipe Pekerjaan', _selectedWorkType ?? '-'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK', style: TextStyle(color: Color(0xFF00897B), fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: const [
              Icon(Icons.check_circle, color: Colors.white, size: 20),
              SizedBox(width: 10),
              Text('Data telah disimpan!', style: TextStyle(fontWeight: FontWeight.w500)),
            ],
          ),
          backgroundColor: const Color(0xFF00897B),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          duration: const Duration(seconds: 2),
          margin: const EdgeInsets.all(16),
        ),
      );
    }
  }

  void _resetForm() {
    _formKey.currentState?.reset();
    _namaController.clear();
    _umurController.clear();
    setState(() {
      _selectedGender = null;
      _selectedJob = null;
      _selectedWorkType = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF00695C), Color(0xFF00897B)],
            ),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
          ),
        ),
        title: const Text('Form Professional', 
          style: TextStyle(fontWeight: FontWeight.w700, letterSpacing: 0.3, fontSize: 18)),
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildModernSection('Data Diri', Icons.person_outline, [
                  Card(
                    elevation: 2,
                    shadowColor: Colors.black12,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          _buildModernTextField(
                            controller: _namaController,
                            label: 'Nama Lengkap',
                            hint: 'Masukkan nama lengkap Anda',
                            icon: Icons.person_outline,
                            validator: (value) => (value == null || value.isEmpty) ? 'Nama tidak boleh kosong' : null,
                          ),
                          const SizedBox(height: 20),
                          _buildModernTextField(
                            controller: _umurController,
                            label: 'Umur',
                            hint: 'Masukkan umur Anda',
                            icon: Icons.cake_outlined,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) return 'Umur tidak boleh kosong';
                              int? age = int.tryParse(value);
                              if (age == null || age < 17 || age > 100) return 'Umur harus antara 17-100 tahun';
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),

                const SizedBox(height: 24),

                _buildModernSection('Jenis Kelamin', Icons.people_outline, [
                  Card(
                    elevation: 2,
                    shadowColor: Colors.black12,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: FormField<String>(
                        validator: (value) => _selectedGender == null ? 'Jenis kelamin harus dipilih' : null,
                        builder: (state) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: _buildAnimatedGenderCard(
                                      title: 'Laki-laki',
                                      value: 'Laki-laki',
                                      groupValue: _selectedGender,
                                      icon: Icons.male,
                                      color: const Color(0xFF2196F3),
                                      gradient: const LinearGradient(colors: [Color(0xFF2196F3), Color(0xFF64B5F6)]),
                                      onChanged: (val) {
                                        setState(() => _selectedGender = val);
                                        state.didChange(val);
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: _buildAnimatedGenderCard(
                                      title: 'Perempuan',
                                      value: 'Perempuan',
                                      groupValue: _selectedGender,
                                      icon: Icons.female,
                                      color: const Color(0xFFE91E63),
                                      gradient: const LinearGradient(colors: [Color(0xFFE91E63), Color(0xFFF06292)]),
                                      onChanged: (val) {
                                        setState(() => _selectedGender = val);
                                        state.didChange(val);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              if (state.hasError) _buildErrorText(state.errorText!),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ]),

                const SizedBox(height: 24),

                _buildModernSection('Pekerjaan', Icons.work_outline, [
                  Card(
                    elevation: 2,
                    shadowColor: Colors.black12,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: FormField<String>(
                        validator: (value) => _selectedJob == null ? 'Pekerjaan harus dipilih' : null,
                        builder: (state) {
                          return Column(
                            children: [
                              Wrap(
                                spacing: 10,
                                runSpacing: 10,
                                children: _jobOptions.asMap().entries.map((entry) {
                                  return _buildAnimatedChoiceChip(
                                    job: entry.value,
                                    isSelected: _selectedJob == entry.value['value'],
                                    index: entry.key,
                                    onSelected: (selected) {
                                      setState(() => _selectedJob = selected ? entry.value['value'] : null);
                                      state.didChange(_selectedJob);
                                    },
                                  );
                                }).toList(),
                              ),
                              if (state.hasError) _buildErrorText(state.errorText!),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ]),

                const SizedBox(height: 24),

                _buildModernSection('Tipe Pekerjaan', Icons.business_center_outlined, [
                  FormField<String>(
                    validator: (value) => _selectedWorkType == null ? 'Tipe pekerjaan harus dipilih' : null,
                    builder: (state) {
                      return Column(
                        children: [
                          ..._workTypeOptions.map((work) => Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: _buildModernWorkTile(
                              work: work,
                              groupValue: _selectedWorkType,
                              onChanged: (val) {
                                setState(() => _selectedWorkType = val);
                                state.didChange(val);
                              },
                            ),
                          )),
                          if (state.hasError) _buildErrorText(state.errorText!),
                        ],
                      );
                    },
                  ),
                ]),

                const SizedBox(height: 32),

                Row(
                  children: [
                    Expanded(child: _buildGradientButton(_submitForm, 'Simpan Data', Icons.save_outlined)),
                    const SizedBox(width: 16),
                    Expanded(child: _buildOutlineButton(_resetForm, 'Reset', Icons.refresh)),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- WIDGET HELPERS ---

  Widget _buildModernSection(String title, IconData icon, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 12),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [Color(0xFF00695C), Color(0xFF00897B)]),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, size: 18, color: Colors.white),
              ),
              const SizedBox(width: 12),
              Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF2C3E50))),
            ],
          ),
        ),
        ...children,
      ],
    );
  }

  Widget _buildModernTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    required String? Function(String?) validator,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(icon, color: const Color(0xFF00897B)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: Colors.grey[300]!)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: Colors.grey[300]!)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: const BorderSide(color: Color(0xFF00897B), width: 2)),
      ),
      validator: validator,
    );
  }

  Widget _buildAnimatedGenderCard({
    required String title, required String value, required String? groupValue,
    required IconData icon, required Color color, required Gradient gradient,
    required void Function(String?) onChanged,
  }) {
    final isSelected = groupValue == value;
    return GestureDetector(
      onTap: () => onChanged(value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          gradient: isSelected ? gradient : null,
          color: isSelected ? null : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: isSelected ? Colors.transparent : color.withOpacity(0.3), width: 1.5),
          boxShadow: isSelected ? [BoxShadow(color: color.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 4))] : null,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: isSelected ? Colors.white : color, size: 20),
              const SizedBox(width: 8),
              Text(title, style: TextStyle(fontWeight: FontWeight.w600, color: isSelected ? Colors.white : color)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedChoiceChip({required Map<String, dynamic> job, required bool isSelected, required int index, required void Function(bool) onSelected}) {
    return ChoiceChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(job['icon'], size: 18, color: isSelected ? Colors.white : job['color']),
          const SizedBox(width: 8),
          Text(job['value']),
          // DESKRIPSI HANYA MUNCUL SAAT DIPILIH
          if (isSelected && job['description'] != null) ...[
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(12)),
              child: Text(job['description'], style: const TextStyle(fontSize: 10, color: Colors.white)),
            ),
          ],
        ],
      ),
      selected: isSelected,
      onSelected: onSelected,
      selectedColor: job['color'],
      backgroundColor: Colors.white,
      labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.grey[700], fontWeight: FontWeight.w500),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30), side: BorderSide(color: isSelected ? Colors.transparent : job['color'].withOpacity(0.2))),
    );
  }

  Widget _buildModernWorkTile({required Map<String, dynamic> work, required String? groupValue, required void Function(String?) onChanged}) {
    final isSelected = groupValue == work['value'];
    final Color workColor = work['color'];

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: isSelected ? workColor.withOpacity(0.05) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: isSelected ? workColor : Colors.grey[200]!, width: isSelected ? 2 : 1),
      ),
      child: RadioListTile<String>(
        value: work['value'],
        groupValue: groupValue,
        onChanged: onChanged,
        activeColor: workColor,
        title: Text(work['value'], style: const TextStyle(fontWeight: FontWeight.bold)),
        // DETAIL HANYA MUNCUL SAAT DIPILIH
        subtitle: isSelected 
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(work['subtitle'], style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 6,
                  children: (work['benefits'] as List).map((benefit) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(color: workColor.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
                    child: Text(benefit, style: TextStyle(fontSize: 10, color: workColor, fontWeight: FontWeight.w500)),
                  )).toList(),
                ),
              ],
            )
          : null,
        secondary: Icon(work['icon'], color: workColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  Widget _buildErrorText(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 12),
      child: Row(
        children: [
          const Icon(Icons.error_outline, color: Color(0xFFE53935), size: 14),
          const SizedBox(width: 6),
          Text(text, style: const TextStyle(color: Color(0xFFE53935), fontSize: 12, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildGradientButton(VoidCallback onPressed, String text, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFF00695C), Color(0xFF00897B)]),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white, size: 20),
        label: Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent, padding: const EdgeInsets.symmetric(vertical: 14)),
      ),
    );
  }

  Widget _buildOutlineButton(VoidCallback onPressed, String text, IconData icon) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: const Color(0xFF00897B), size: 20),
      label: Text(text, style: const TextStyle(color: Color(0xFF00897B), fontWeight: FontWeight.bold)),
      style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14), side: const BorderSide(color: Color(0xFF00897B), width: 2), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
    );
  }

  Widget _buildModernInfoRow(IconData icon, String label, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.grey[50], borderRadius: BorderRadius.circular(14)),
      child: Row(
        children: [
          Icon(icon, size: 18, color: const Color(0xFF00897B)),
          const SizedBox(width: 12),
          Text('$label:', style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF2C3E50))),
          const SizedBox(width: 8),
          Expanded(child: Text(value, style: const TextStyle(color: Color(0xFF546E7A)), overflow: TextOverflow.ellipsis)),
        ],
      ),
    );
  }
}