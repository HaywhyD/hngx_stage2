import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditScreen extends StatefulWidget {
  final String bio;
  final String fullName;
  final String slackName;
  final String githubHandle;
  final String skills;
  final String language;
  final List work;
  final List education;
  final List certification;

  const EditScreen({
    super.key,
    required this.fullName,
    required this.slackName,
    required this.githubHandle,
    required this.bio,
    required this.skills,
    required this.language,
    required this.work,
    required this.education,
    required this.certification,
  });

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _slackUsername = TextEditingController();
  final TextEditingController _github = TextEditingController();
  final TextEditingController _bio = TextEditingController();
  final TextEditingController _skills = TextEditingController();
  final TextEditingController _language = TextEditingController();
  final List<TextEditingController> _workRole = [];
  final List<TextEditingController> _workOrganization = [];
  final List<TextEditingController> _workStartMonth = [];
  final List<TextEditingController> _workStartYear = [];
  final List<TextEditingController> _workEndMonth = [];
  final List<TextEditingController> _workEndYear = [];
  final List<TextEditingController> _workRoleDesc = [];
  final List<TextEditingController> _educationSchool = [];
  final List<TextEditingController> _educationStartYear = [];
  final List<TextEditingController> _educationEndYear = [];
  final List<TextEditingController> _educationDegree = [];
  final List<TextEditingController> _certificationInstitution = [];
  final List<TextEditingController> _certificationYear = [];
  final List<TextEditingController> _certificationCert = [];
  List _work = [];
  List _education = [];
  List _certification = [];

  updateDetails() {
    for (int i = 0; i < _work.length; i++) {
      _workRole.add(TextEditingController());
      _workOrganization.add(TextEditingController());
      _workStartMonth.add(TextEditingController());
      _workStartYear.add(TextEditingController());
      _workEndMonth.add(TextEditingController());
      _workEndYear.add(TextEditingController());
      _workRoleDesc.add(TextEditingController());

      setState(() {
        _workRole[i].text = _work[i]['role'];
        _workOrganization[i].text = _work[i]['company'];
        _workStartMonth[i].text = _work[i]['startMonth'];
        _workStartYear[i].text = _work[i]['startYear'];
        _workEndMonth[i].text = _work[i]['endMonth'];
        _workEndYear[i].text = _work[i]['endYear'];
        _workRoleDesc[i].text = _work[i]['workRoles'];
      });
    }
    for (int i = 0; i < _education.length; i++) {
      _educationSchool.add(TextEditingController());
      _educationStartYear.add(TextEditingController());
      _educationEndYear.add(TextEditingController());
      _educationDegree.add(TextEditingController());

      setState(() {
        _educationSchool[i].text = _education[i]['school'];
        _educationStartYear[i].text = _education[i]['startYear'];
        _educationEndYear[i].text = _education[i]['endYear'];
        _educationDegree[i].text = _education[i]['degree'];
      });
    }

    for (int i = 0; i < _certification.length; i++) {
      _certificationInstitution.add(TextEditingController());
      _certificationYear.add(TextEditingController());
      _certificationCert.add(TextEditingController());

      setState(() {
        _certificationInstitution[i].text = _certification[i]['institution'];
        _certificationYear[i].text = _certification[i]['year'];
        _certificationCert[i].text = _certification[i]['certification'];
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _fullName.dispose();
    _slackUsername.dispose();
    _bio.dispose();
    _github.dispose();
    _language.dispose();
    _skills.dispose();

    for (int i = 0; i < _work.length; i++) {
      _workRole[i].dispose();
      _workOrganization[i].dispose();
      _workStartMonth[i].dispose();
      _workStartYear[i].dispose();
      _workEndMonth[i].dispose();
      _workEndYear[i].dispose();
      _workRoleDesc[i].dispose();
    }
    for (int i = 0; i < _education.length; i++) {
      _educationSchool[i].dispose();
      _educationStartYear[i].dispose();
      _educationEndYear[i].dispose();
      _educationDegree[i].dispose();
    }

    for (int i = 0; i < _certification.length; i++) {
      _certificationInstitution[i].dispose();
      _certificationYear[i].dispose();
      _certificationCert[i].dispose();
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _work = widget.work;
      _education = widget.education;
      _certification = widget.certification;
      _fullName.text = widget.fullName;
      _slackUsername.text = widget.slackName;
      _github.text = widget.githubHandle;
      _bio.text = widget.bio;
      _skills.text = widget.skills;
      _language.text = widget.language;
    });
    updateDetails();
  }

  @override
  Widget build(BuildContext context) {
    Theme.of(context).brightness == Brightness.dark
        ? SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(
              statusBarColor: Color.fromARGB(0, 10, 3, 3),
              statusBarIconBrightness: Brightness.light,
              systemNavigationBarContrastEnforced: true,
              systemNavigationBarColor: Colors.transparent,
              systemNavigationBarIconBrightness: Brightness.light,
            ),
          )
        : SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarContrastEnforced: true,
              systemNavigationBarColor: Colors.transparent,
              systemNavigationBarIconBrightness: Brightness.dark,
            ),
          );

    return WillPopScope(
      onWillPop: () async {
        if (FocusScope.of(context).hasFocus) {
          FocusScope.of(context).unfocus();

          return false;
        } else {
          Navigator.pop(context);
          return true;
        }
      },
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  left: 15,
                  top: 30,
                  right: 15,
                ),
                color: Theme.of(context).brightness == Brightness.dark
                    ? const Color(0xFF181818)
                    : Colors.white,
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () async {
                          FocusScope.of(context).unfocus();

                          List newDetails = [
                            _fullName.text,
                            _slackUsername.text,
                            _github.text,
                            _bio.text,
                            _skills.text,
                            _language.text,
                            _work,
                            _education,
                            _certification,
                          ];
                          Navigator.pop(context, newDetails);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? const Color(0xFF353945)
                                    : Colors.grey.shade200,
                            shape: BoxShape.circle,
                          ),
                          height: 25,
                          width: 25,
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 16,
                            weight: 600,
                          ),
                        ),
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(
                        width: double.infinity,
                      ),
                    ),
                    const Text(
                      'Edit details',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(
                        width: double.infinity,
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.88,
                child: Scaffold(
                  resizeToAvoidBottomInset: true,
                  body: SingleChildScrollView(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    physics: const AlwaysScrollableScrollPhysics(
                        parent: PageScrollPhysics()),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'A brief personal bio',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? const Color(0xFF212121)
                                    : const Color(0xFFF5F6F8),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() {
                                _bio.text = value;
                              });
                            },
                            controller: _bio,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                            maxLines: 7,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              border: InputBorder.none,
                              hintText: 'A brief personal bio',
                            ),
                            cursorColor: const Color(0xFF8EC4C4),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Slack Username',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? const Color(0xFF212121)
                                    : const Color(0xFFF5F6F8),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() {
                                _slackUsername.text = value;
                              });
                            },
                            controller: _slackUsername,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              border: InputBorder.none,
                              hintText: 'Enter your slack username',
                            ),
                            cursorColor: const Color(0xFF8EC4C4),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'GitHub Handle',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? const Color(0xFF212121)
                                    : const Color(0xFFF5F6F8),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() {
                                _github.text = value;
                              });
                            },
                            controller: _github,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              border: InputBorder.none,
                              hintText: 'Enter your github handle',
                            ),
                            cursorColor: const Color(0xFF8EC4C4),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Full Name',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? const Color(0xFF212121)
                                    : const Color(0xFFF5F6F8),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() {
                                _fullName.text = value;
                              });
                            },
                            controller: _fullName,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              border: InputBorder.none,
                              hintText: 'Enter full name',
                            ),
                            cursorColor: const Color(0xFF8EC4C4),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Skills',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? const Color(0xFF212121)
                                    : const Color(0xFFF5F6F8),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() {
                                _skills.text = value;
                              });
                            },
                            controller: _skills,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              border: InputBorder.none,
                              hintText: 'e.g Flutter, HTML, CSS',
                            ),
                            cursorColor: const Color(0xFF8EC4C4),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Language',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? const Color(0xFF212121)
                                    : const Color(0xFFF5F6F8),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() {
                                _language.text = value;
                              });
                            },
                            controller: _language,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              border: InputBorder.none,
                              hintText: 'e.g English, French',
                            ),
                            cursorColor: const Color(0xFF8EC4C4),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Work Experience',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.grey.shade600,
                          ),
                        ),
                        for (int i = 0; i < _work.length; i++)
                          Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? const Color(0xFF353945)
                                            : Colors.grey.shade300,
                                      ),
                                      child: Text((i + 1).toString()),
                                    ),
                                  ),
                                  Flexible(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Position',
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? Colors.white
                                                          : Colors
                                                              .grey.shade600,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? const Color(
                                                              0xFF212121)
                                                          : const Color(
                                                              0xFFF5F6F8),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: TextFormField(
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _workRole[i].text =
                                                              value;
                                                          _work[i]['role'] =
                                                              value;
                                                        });
                                                      },
                                                      controller: _workRole[i],
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                      ),
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          const InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                          horizontal: 20,
                                                        ),
                                                        border:
                                                            InputBorder.none,
                                                        hintText:
                                                            'e.g Lead Developer',
                                                      ),
                                                      cursorColor: const Color(
                                                          0xFF8EC4C4),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Organization',
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? Colors.white
                                                          : Colors
                                                              .grey.shade600,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? const Color(
                                                              0xFF212121)
                                                          : const Color(
                                                              0xFFF5F6F8),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: TextFormField(
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _workOrganization[i]
                                                              .text = value;

                                                          _work[i]['company'] =
                                                              value;
                                                        });
                                                      },
                                                      controller:
                                                          _workOrganization[i],
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                      ),
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          const InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                          horizontal: 20,
                                                        ),
                                                        border:
                                                            InputBorder.none,
                                                        hintText:
                                                            'e.g WebEdge Services',
                                                      ),
                                                      cursorColor: const Color(
                                                          0xFF8EC4C4),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Start Month',
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? Colors.white
                                                          : Colors
                                                              .grey.shade600,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? const Color(
                                                              0xFF212121)
                                                          : const Color(
                                                              0xFFF5F6F8),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: TextFormField(
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _workStartMonth[i]
                                                              .text = value;
                                                          _work[i][
                                                                  'startMonth'] =
                                                              value;
                                                        });
                                                      },
                                                      controller:
                                                          _workStartMonth[i],
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                      ),
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          const InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                          horizontal: 20,
                                                        ),
                                                        border:
                                                            InputBorder.none,
                                                        hintText: 'e.g June',
                                                      ),
                                                      cursorColor: const Color(
                                                          0xFF8EC4C4),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Start Year',
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? Colors.white
                                                          : Colors
                                                              .grey.shade600,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? const Color(
                                                              0xFF212121)
                                                          : const Color(
                                                              0xFFF5F6F8),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: TextFormField(
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _workStartYear[i]
                                                              .text = value;
                                                          _work[i][
                                                                  'startYear'] =
                                                              value;
                                                        });
                                                      },
                                                      controller:
                                                          _workStartYear[i],
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                      ),
                                                      keyboardType:
                                                          TextInputType.number,
                                                      decoration:
                                                          const InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                          horizontal: 20,
                                                        ),
                                                        border:
                                                            InputBorder.none,
                                                        hintText: 'e.g 2022',
                                                      ),
                                                      cursorColor: const Color(
                                                          0xFF8EC4C4),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'End Month',
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? Colors.white
                                                          : Colors
                                                              .grey.shade600,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? const Color(
                                                              0xFF212121)
                                                          : const Color(
                                                              0xFFF5F6F8),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: TextFormField(
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _workEndMonth[i]
                                                              .text = value;
                                                          _work[i]['endMonth'] =
                                                              value;
                                                        });
                                                      },
                                                      controller:
                                                          _workEndMonth[i],
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                      ),
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          const InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                          horizontal: 20,
                                                        ),
                                                        border:
                                                            InputBorder.none,
                                                        hintText: 'e.g June',
                                                      ),
                                                      cursorColor: const Color(
                                                          0xFF8EC4C4),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'End Year',
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? Colors.white
                                                          : Colors
                                                              .grey.shade600,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? const Color(
                                                              0xFF212121)
                                                          : const Color(
                                                              0xFFF5F6F8),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: TextFormField(
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _workEndYear[i].text =
                                                              value;
                                                          _work[i]['endYear'] =
                                                              value;
                                                        });
                                                      },
                                                      controller:
                                                          _workEndYear[i],
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                      ),
                                                      keyboardType:
                                                          TextInputType.number,
                                                      decoration:
                                                          const InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                          horizontal: 20,
                                                        ),
                                                        border:
                                                            InputBorder.none,
                                                        hintText: 'e.g 2022',
                                                      ),
                                                      cursorColor: const Color(
                                                          0xFF8EC4C4),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Roles',
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? Colors.white
                                                          : Colors
                                                              .grey.shade600,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? const Color(
                                                              0xFF212121)
                                                          : const Color(
                                                              0xFFF5F6F8),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: TextFormField(
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _workRoleDesc[i]
                                                              .text = value;
                                                          _work[i][
                                                                  'workRoles'] =
                                                              value;
                                                        });
                                                      },
                                                      controller:
                                                          _workRoleDesc[i],
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                      ),
                                                      maxLines: 6,
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          const InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                          vertical: 10,
                                                          horizontal: 20,
                                                        ),
                                                        border:
                                                            InputBorder.none,
                                                        hintText:
                                                            'e.g Describe what roles you performed',
                                                      ),
                                                      cursorColor: const Color(
                                                          0xFF8EC4C4),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () async {
                              setState(() {
                                _work.add(
                                  {
                                    'role': '',
                                    'company': '',
                                    'startMonth': '',
                                    'startYear': '',
                                    'endMonth': '',
                                    'endYear': '',
                                    'workRoles': '',
                                  },
                                );
                                updateDetails();
                              });
                            },
                            child: Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? const Color(0xFF353945)
                                        : Colors.grey.shade300,
                                  ),
                                  child: const Text(
                                    '+',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Add Work experience',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Education',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.grey.shade600,
                          ),
                        ),
                        for (int i = 0; i < _education.length; i++)
                          Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? const Color(0xFF353945)
                                            : Colors.grey.shade300,
                                      ),
                                      child: Text((i + 1).toString()),
                                    ),
                                  ),
                                  Flexible(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'School',
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? Colors.white
                                                          : Colors
                                                              .grey.shade600,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? const Color(
                                                              0xFF212121)
                                                          : const Color(
                                                              0xFFF5F6F8),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: TextFormField(
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _educationSchool[i]
                                                              .text = value;
                                                          _education[i]
                                                                  ['school'] =
                                                              value;
                                                        });
                                                      },
                                                      controller:
                                                          _educationSchool[i],
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                      ),
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          const InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                          horizontal: 20,
                                                        ),
                                                        border:
                                                            InputBorder.none,
                                                        hintText:
                                                            'e.g Federal University of Agriculture, Abk',
                                                      ),
                                                      cursorColor: const Color(
                                                          0xFF8EC4C4),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Start Year',
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? Colors.white
                                                          : Colors
                                                              .grey.shade600,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? const Color(
                                                              0xFF212121)
                                                          : const Color(
                                                              0xFFF5F6F8),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: TextFormField(
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _educationStartYear[i]
                                                              .text = value;
                                                          _education[i][
                                                                  'startYear'] =
                                                              value;
                                                        });
                                                      },
                                                      controller:
                                                          _educationStartYear[
                                                              i],
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                      ),
                                                      keyboardType:
                                                          TextInputType.number,
                                                      decoration:
                                                          const InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                          horizontal: 20,
                                                        ),
                                                        border:
                                                            InputBorder.none,
                                                        hintText: 'e.g 2021',
                                                      ),
                                                      cursorColor: const Color(
                                                          0xFF8EC4C4),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'End Year',
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? Colors.white
                                                          : Colors
                                                              .grey.shade600,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? const Color(
                                                              0xFF212121)
                                                          : const Color(
                                                              0xFFF5F6F8),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: TextFormField(
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _educationEndYear[i]
                                                              .text = value;
                                                          _education[i]
                                                                  ['endYear'] =
                                                              value;
                                                        });
                                                      },
                                                      controller:
                                                          _educationEndYear[i],
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                      ),
                                                      keyboardType:
                                                          TextInputType.number,
                                                      decoration:
                                                          const InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                          horizontal: 20,
                                                        ),
                                                        border:
                                                            InputBorder.none,
                                                        hintText: 'e.g 2022',
                                                      ),
                                                      cursorColor: const Color(
                                                          0xFF8EC4C4),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Degree',
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? Colors.white
                                                          : Colors
                                                              .grey.shade600,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? const Color(
                                                              0xFF212121)
                                                          : const Color(
                                                              0xFFF5F6F8),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: TextFormField(
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _educationDegree[i]
                                                              .text = value;
                                                          _education[i]
                                                                  ['degree'] =
                                                              value;
                                                        });
                                                      },
                                                      controller:
                                                          _educationDegree[i],
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                      ),
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          const InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                          horizontal: 20,
                                                        ),
                                                        border:
                                                            InputBorder.none,
                                                        hintText:
                                                            'e.g BSc: Computer Science',
                                                      ),
                                                      cursorColor: const Color(
                                                          0xFF8EC4C4),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () async {
                              setState(() {
                                _education.add(
                                  {
                                    'school': '',
                                    'startYear': '',
                                    'endYear': '',
                                    'degree': '',
                                  },
                                );
                                updateDetails();
                              });
                            },
                            child: Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? const Color(0xFF353945)
                                        : Colors.grey.shade300,
                                  ),
                                  child: const Text(
                                    '+',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Add Education',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Certification',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.grey.shade600,
                          ),
                        ),
                        for (int i = 0; i < _certification.length; i++)
                          Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? const Color(0xFF353945)
                                            : Colors.grey.shade300,
                                      ),
                                      child: Text((i + 1).toString()),
                                    ),
                                  ),
                                  Flexible(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Institution',
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? Colors.white
                                                          : Colors
                                                              .grey.shade600,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? const Color(
                                                              0xFF212121)
                                                          : const Color(
                                                              0xFFF5F6F8),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: TextFormField(
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _certificationInstitution[
                                                                  i]
                                                              .text = value;
                                                          _certification[i][
                                                                  'institution'] =
                                                              value;
                                                        });
                                                      },
                                                      controller:
                                                          _certificationInstitution[
                                                              i],
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                      ),
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          const InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                          horizontal: 20,
                                                        ),
                                                        border:
                                                            InputBorder.none,
                                                        hintText:
                                                            'e.g Side Hustle',
                                                      ),
                                                      cursorColor: const Color(
                                                          0xFF8EC4C4),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Year',
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? Colors.white
                                                          : Colors
                                                              .grey.shade600,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? const Color(
                                                              0xFF212121)
                                                          : const Color(
                                                              0xFFF5F6F8),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: TextFormField(
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _certificationYear[i]
                                                              .text = value;
                                                          _certification[i]
                                                              ['year'] = value;
                                                        });
                                                      },
                                                      controller:
                                                          _certificationYear[i],
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                      ),
                                                      keyboardType:
                                                          TextInputType.number,
                                                      decoration:
                                                          const InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                          horizontal: 20,
                                                        ),
                                                        border:
                                                            InputBorder.none,
                                                        hintText: 'e.g 2021',
                                                      ),
                                                      cursorColor: const Color(
                                                          0xFF8EC4C4),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Certification',
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? Colors.white
                                                          : Colors
                                                              .grey.shade600,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? const Color(
                                                              0xFF212121)
                                                          : const Color(
                                                              0xFFF5F6F8),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: TextFormField(
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _certificationCert[i]
                                                              .text = value;
                                                          _certification[i][
                                                                  'certification'] =
                                                              value;
                                                        });
                                                      },
                                                      controller:
                                                          _certificationCert[i],
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                      ),
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          const InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                          horizontal: 20,
                                                        ),
                                                        border:
                                                            InputBorder.none,
                                                        hintText:
                                                            'e.g Certificate of Completion, Mobile Development',
                                                      ),
                                                      cursorColor: const Color(
                                                          0xFF8EC4C4),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () async {
                              setState(() {
                                _certification.add(
                                  {
                                    'institution': '',
                                    'year': '',
                                    'certification': '',
                                  },
                                );
                                updateDetails();
                              });
                            },
                            child: Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? const Color(0xFF353945)
                                        : Colors.grey.shade300,
                                  ),
                                  child: const Text(
                                    '+',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Add Certification',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _fullName.text.isEmpty ||
                                    _slackUsername.text.isEmpty ||
                                    _bio.text.isEmpty ||
                                    _github.text.isEmpty ||
                                    _work.isEmpty ||
                                    _education.isEmpty ||
                                    _certification.isEmpty
                                ? null
                                : () async {
                                    List newDetails = [
                                      _fullName.text,
                                      _slackUsername.text,
                                      _github.text,
                                      _bio.text,
                                      _skills.text,
                                      _language.text,
                                      _work,
                                      _education,
                                      _certification,
                                    ];
                                    Navigator.pop(context, newDetails);
                                  },
                            child: const Text(
                              'Confirm',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
