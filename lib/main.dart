import 'package:flutter/material.dart';
import 'founder.dart';

void main() {
  runApp(const KhadamatiAnbarApp());
}

class KhadamatiAnbarApp extends StatelessWidget {
  const KhadamatiAnbarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'خدماتي - الأنبار',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Cairo',
      ),
      // جعلنا البداية تشير إلى شاشة اللوجو والترحيب
      home: const SplashScreen(),
    );
  }
}

// 0. شاشة اللوجو / شعار التطبيق (تظهر لمدة 7 ثوانٍ بشكل جذاب ومرتب)
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // الانتقال التلقائي بعد 7 ثوانٍ إلى شاشة اختيار الموقع
    Future.delayed(const Duration(seconds: 7), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LocationSelectionScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // إطار أنيق يحيط بالشعار والأيقونة
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E293B),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.amber, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.amber.withOpacity(0.3),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.home_repair_service,
                  size: 70,
                  color: Colors.amber,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'تطبيق خدماتي - الأنبار',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.1,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'منصتك الأولى لصيانة وخدمات الأعمال المنزلية',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white60,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              // مؤشر تحميل جذاب يشير لانتظار الثواني السبع
              const SizedBox(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(
                  color: Colors.amber,
                  strokeWidth: 3,
                ),
              ),
              const SizedBox(height: 40),
              // بصمة التأسيس في شاشة الترحيب
              const FounderInfoWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

// 1. تحديد الموقع في الأنبار
class LocationSelectionScreen extends StatefulWidget {
  const LocationSelectionScreen({Key? key}) : super(key: key);

  @override
  State<LocationSelectionScreen> createState() => _LocationSelectionScreenState();
}

class _LocationSelectionScreenState extends State<LocationSelectionScreen> {
  final String selectedGovernorate = 'الأنبار';
  final String selectedDistrict = 'الرمادي (المركز)';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E293B),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'خطوة 1: تحديد الموقع في الأنبار',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 20),
                const Icon(Icons.location_on, size: 60, color: Colors.amber),
                const SizedBox(height: 12),
                const Text(
                  'تطبيق خدماتي مخصص لمحافظة الأنبار فقط',
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerRight,
                  child: const Text('المحافظة', style: TextStyle(color: Colors.amber, fontSize: 13)),
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: const Color(0xFF334155),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.location_city, color: Colors.amber, size: 20),
                      const SizedBox(width: 12),
                      Text(selectedGovernorate, style: const TextStyle(color: Colors.white, fontSize: 16)),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: const Text('اختر منطقتك أو قضاءك', style: TextStyle(color: Colors.white60, fontSize: 12)),
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: const Color(0xFF334155),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.pin_drop, color: Colors.amber, size: 20),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(selectedDistrict, style: const TextStyle(color: Colors.white, fontSize: 16)),
                      ),
                      const Icon(Icons.arrow_drop_down, color: Colors.white70),
                    ],
                  ),
                ),
                const SizedBox(height: 35),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.black87,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RoleSelectionScreen()),
                    );
                  },
                  child: const Text('متابعة لاختيار نوع الحساب', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 40),
                const FounderInfoWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 2. اختيار نوع الحساب
class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E293B),
      appBar: AppBar(
        title: const Text('اختيار نوع الحساب', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF0F172A),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.engineering, size: 70, color: Colors.amber),
                const SizedBox(height: 20),
                const Text('كيف ترغب في استخدام التطبيق؟', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 40),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white, minimumSize: const Size(double.infinity, 55)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const CustomerAuthScreen()));
                  },
                  icon: const Icon(Icons.person, size: 26),
                  label: const Text('دخول / تسجيل زبون', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white, minimumSize: const Size(double.infinity, 55)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const TechnicianAuthScreen()));
                  },
                  icon: const Icon(Icons.handyman, size: 26),
                  label: const Text('دخول / تسجيل فني صيانة', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 40),
                const FounderInfoWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 3. شاشة تسجيل الزبون
class CustomerAuthScreen extends StatelessWidget {
  const CustomerAuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E293B),
      appBar: AppBar(title: const Text('تسجيل دخول / حساب زبون', style: TextStyle(color: Colors.white)), backgroundColor: const Color(0xFF0F172A), iconTheme: const IconThemeData(color: Colors.white)),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 450),
            child: Column(
              children: [
                const TextField(decoration: InputDecoration(labelText: 'الاسم الكامل', filled: true, fillColor: Color(0xFF334155), labelStyle: TextStyle(color: Colors.white70))),
                const SizedBox(height: 16),
                const TextField(decoration: InputDecoration(labelText: 'رقم الهاتف', filled: true, fillColor: Color(0xFF334155), labelStyle: TextStyle(color: Colors.white70))),
                const SizedBox(height: 16),
                const TextField(obscureText: true, decoration: InputDecoration(labelText: 'كلمة المرور', filled: true, fillColor: Color(0xFF334155), labelStyle: TextStyle(color: Colors.white70))),
                const SizedBox(height: 16),
                const TextField(decoration: InputDecoration(labelText: 'الجنس (ذكر / أنثى)', filled: true, fillColor: Color(0xFF334155), labelStyle: TextStyle(color: Colors.white70))),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.amber, minimumSize: const Size(double.infinity, 50)),
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const CustomerDashboard()));
                  },
                  child: const Text('تسجيل الدخول', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 30),
                const FounderInfoWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 4. شاشة تسجيل الفني
class TechnicianAuthScreen extends StatefulWidget {
  const TechnicianAuthScreen({Key? key}) : super(key: key);

  @override
  State<TechnicianAuthScreen> createState() => _TechnicianAuthScreenState();
}

class _TechnicianAuthScreenState extends State<TechnicianAuthScreen> {
  bool isRegistering = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E293B),
      appBar: AppBar(title: const Text('بوابة الفنيين', style: TextStyle(color: Colors.white)), backgroundColor: const Color(0xFF0F172A), iconTheme: const IconThemeData(color: Colors.white)),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 450),
            child: Column(
              children: [
                Text(isRegistering ? 'تقديم طلب انضمام فني جديد' : 'تسجيل دخول الفني', style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                if (isRegistering) ...[
                  const TextField(decoration: InputDecoration(labelText: 'الاسم الكامل', filled: true, fillColor: Color(0xFF334155), labelStyle: TextStyle(color: Colors.white70))),
                  const SizedBox(height: 12),
                  const TextField(decoration: InputDecoration(labelText: 'نوع العمل (كهرباء، تبريد، صحيات...)', filled: true, fillColor: Color(0xFF334155), labelStyle: TextStyle(color: Colors.white70))),
                  const SizedBox(height: 12),
                  const TextField(decoration: InputDecoration(labelText: 'رقم البطاقة الوطنية / الهوية', filled: true, fillColor: Color(0xFF334155), labelStyle: TextStyle(color: Colors.white70))),
                  const SizedBox(height: 12),
                ],
                const TextField(decoration: InputDecoration(labelText: 'رقم الهاتف', filled: true, fillColor: Color(0xFF334155), labelStyle: TextStyle(color: Colors.white70))),
                const SizedBox(height: 12),
                const TextField(obscureText: true, decoration: InputDecoration(labelText: 'كلمة المرور', filled: true, fillColor: Color(0xFF334155), labelStyle: TextStyle(color: Colors.white70))),
                const SizedBox(height: 25),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.amber, minimumSize: const Size(double.infinity, 50)),
                  onPressed: () {
                    if (isRegistering) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('تم إرسال طلبك'),
                          content: const Text('تم استلام مستمسكاتك وبياناتك بنجاح. بانتظار موافقة المهندس عمر العبيدي (الإدارة) للدخول.'),
                          actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('حسناً'))],
                        ),
                      );
                    } else {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const TechnicianDashboard()));
                    }
                  },
                  child: Text(isRegistering ? 'إرسال طلب الانضمام للإدارة' : 'دخول', style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                ),
                TextButton(
                  onPressed: () => setState(() => isRegistering = !isRegistering),
                  child: Text(isRegistering ? 'لديك حساب؟ سجل دخول هنا' : 'لا تملك حساباً؟ قدم طلب انضمام فني', style: const TextStyle(color: Colors.amber)),
                ),
                const SizedBox(height: 30),
                const FounderInfoWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 5. لوحة تحكم الزبون
class CustomerDashboard extends StatefulWidget {
  const CustomerDashboard({Key? key}) : super(key: key);

  @override
  State<CustomerDashboard> createState() => _CustomerDashboardState();
}

class _CustomerDashboardState extends State<CustomerDashboard> {
  bool shareLocation = true;

  final List<Map<String, dynamic>> homeServices = [
    {'title': 'كهرباء منزلية', 'icon': Icons.bolt, 'color': Colors.amber},
    {'title': 'التبريد والتكييف', 'icon': Icons.ac_unit, 'color': Colors.lightBlue},
    {'title': 'الصحيات والمجاري', 'icon': Icons.water_drop, 'color': Colors.blue},
    {'title': 'النجارة والديكور', 'icon': Icons.carpenter, 'color': Colors.brown},
    {'title': 'الأجهزة المنزلية', 'icon': Icons.tv, 'color': Colors.purple},
    {'title': 'كاميرات المراقبة', 'icon': Icons.videocam, 'color': Colors.teal},
    {'title': 'الطلاء والصباغة', 'icon': Icons.format_paint, 'color': Colors.orange},
    {'title': 'صيانة الأثاث', 'icon': Icons.chair, 'color': Colors.deepOrange},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        title: const Text('أقسام الصيانة والخدمات المنزلية', style: TextStyle(color: Colors.white, fontSize: 18)),
        backgroundColor: const Color(0xFF1E293B),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.amber),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('الإشعارات: تمت الموافقة على طلبك من الفني المختص')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen(userType: 'زبون')));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(color: const Color(0xFF1E293B), borderRadius: BorderRadius.circular(10)),
              child: SwitchListTile(
                title: const Text('مشاركة موقعي الجغرافي مع الفني عند طلب الخدمة', style: TextStyle(color: Colors.white, fontSize: 13)),
                value: shareLocation,
                activeColor: Colors.amber,
                onChanged: (val) => setState(() => shareLocation = val),
              ),
            ),
            const SizedBox(height: 20),
            const Text('اختر القسم المطلوب للصيانة المنزلية:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.3,
              ),
              itemCount: homeServices.length,
              itemBuilder: (context, index) {
                final service = homeServices[index];
                return InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('تم اختيار قسم: ${service['title']} - جاري إرسال الطلب للفني')));
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E293B),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: service['color'].withOpacity(0.5), width: 1.5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(service['icon'], size: 40, color: service['color']),
                        const SizedBox(height: 10),
                        Text(
                          service['title'],
                          style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green, minimumSize: const Size(double.infinity, 48)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatScreen(receiverName: 'الفني المختص')));
                    },
                    icon: const Icon(Icons.chat),
                    label: const Text('محادثة العمل', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey, minimumSize: const Size(double.infinity, 48)),
                    onPressed: () {},
                    icon: const Icon(Icons.list_alt),
                    label: const Text('سجل الطلبات', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const FounderInfoWidget(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        child: const Icon(Icons.support_agent, color: Colors.black),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('خدمة العملاء والمساعدة'),
              content: const Text('للاستفسار أو المساعدة، تواصل مع الإدارة مباشرة.\nالمؤسس: المهندس عمر العبيدي\nهاتف: 07801727594'),
              actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('إغلاق'))],
            ),
          );
        },
      ),
    );
  }
}

// 6. لوحة تحكم الفني
class TechnicianDashboard extends StatelessWidget {
  const TechnicianDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        title: const Text('لوحة تحكم الفني - خدماتي الأنبار', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF1E293B),
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen(userType: 'فني صيانة')));
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('سجل طلبات الصيانة', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 10),
          ListTile(
            tileColor: const Color(0xFF1E293B),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: const Text('طلب صيانة منزلية #102', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            subtitle: const Text('الحالة: مقبول (تم استلام موقع الزبون)', style: TextStyle(color: Colors.greenAccent)),
            trailing: IconButton(
              icon: const Icon(Icons.chat, color: Colors.amber),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatScreen(receiverName: 'الزبون')));
              },
            ),
          ),
          const SizedBox(height: 10),
          ListTile(
            tileColor: const Color(0xFF1E293B),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: const Text('طلب صيانة منزلية #103', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            subtitle: const Text('الحالة: مرفوض (اعتذار لعدم التواجد)', style: TextStyle(color: Colors.redAccent)),
          ),
          const SizedBox(height: 25),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, minimumSize: const Size(double.infinity, 48)),
            onPressed: () {},
            icon: const Icon(Icons.help_outline),
            label: const Text('أيقونة المساعدة والدعم الفني', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 35),
          const FounderInfoWidget(),
        ],
      ),
    );
  }
}

// 7. شاشة المحادثة
class ChatScreen extends StatelessWidget {
  final String receiverName;
  const ChatScreen({Key? key, required this.receiverName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(title: Text('محادثة عمل مع: $receiverName', style: const TextStyle(color: Colors.white)), backgroundColor: const Color(0xFF1E293B)),
      body: Column(
        children: [
          const Expanded(
            child: Center(child: Text('سجل المحادثات الخاصة بالعمل تظهر هنا...', style: TextStyle(color: Colors.white60))),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'اكتب رسالتك هنا...',
                      hintStyle: TextStyle(color: Colors.white60),
                      filled: true,
                      fillColor: Color(0xFF1E293B),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                IconButton(icon: const Icon(Icons.send, color: Colors.amber), onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 8. شاشة الملف الشخصي
class ProfileScreen extends StatefulWidget {
  final String userType;
  const ProfileScreen({Key? key, required this.userType}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool hasCustomImage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(title: Text('الملف الشخصي - ${widget.userType}', style: const TextStyle(color: Colors.white)), backgroundColor: const Color(0xFF1E293B), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.blueGrey,
                  child: Icon(hasCustomImage ? Icons.face : Icons.person, size: 60, color: Colors.white),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hasCustomImage = !hasCustomImage;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('تم تحديث صورة الملف الشخصي اختيارياً بنجاح!')),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.camera_alt, size: 20, color: Colors.black),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text('انقر على أيقونة الكاميرا لتغيير صورة الملف الشخصي اختياريًا', style: TextStyle(color: Colors.white60, fontSize: 12)),
            const SizedBox(height: 25),
            const TextField(style: TextStyle(color: Colors.white), decoration: InputDecoration(labelText: 'تعديل الاسم', filled: true, fillColor: Color(0xFF1E293B), labelStyle: TextStyle(color: Colors.white70))),
            const SizedBox(height: 16),
            const TextField(style: TextStyle(color: Colors.white), decoration: InputDecoration(labelText: 'تعديل رقم الهاتف', filled: true, fillColor: Color(0xFF1E293B), labelStyle: TextStyle(color: Colors.white70))),
            const SizedBox(height: 16),
            const TextField(obscureText: true, style: TextStyle(color: Colors.white), decoration: InputDecoration(labelText: 'تعديل كلمة المرور', filled: true, fillColor: Color(0xFF1E293B), labelStyle: TextStyle(color: Colors.white70))),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber, minimumSize: const Size(double.infinity, 50)),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تم حفظ التعديلات والبيانات بنجاح!')));
              },
              child: const Text('حفظ التعديلات', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 40),
            const FounderInfoWidget(),
          ],
        ),
      ),
    );
  }
}