class LanguageService {
  static String defaultLanguage = 'en';
  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'cAppName': 'MSA',
      'cAppNameDetailed': 'MIREA Student Adaptation',
      'cAppNameDiploma':
          'Mobile Information System\nfor Adaptation of\nForeign University Students',
      'cCopyright': '© Vu Xuan Canh - Project MSA',
      'cHome': 'Home',
      'c404': '404',
      'cGoBack': 'Go Back',
      'cPageNotFoundTitle': 'Page Not Found!',
      'cPageNotFoundSubTitle':
          'We\'re sorry, the page you requested could not be found or it is currently under maintenance. Please try again later!',
      'cLogin': 'Login',
      'cBackToLogin': 'Back to login',
      'cSkipForNow': 'Skip for now',
      'cResendEmail': 'Resend Email',
      'cStudentLogin': 'Student Login',
      'cAdminLogin': 'Admin Login',
      'cStudentRegister': 'Student Register',
      'cSignUp': 'Sign Up',
      'cPhoneNo': 'Phone No',
      'cGroup': 'Group',
      'cGender': 'Gender',
      'cDateOfBirth': 'Date of birth',
      'cShowAddress': 'Show Address',
      'cShowStudyDetails': 'Show Study Details',
      'cHideAddress': 'Hide Address',
      'cHideStudyDetails': 'Hide Study Details',
      'cCity': 'City',
      'cStreet': 'Street',
      'cHouse': 'House',
      'cBuilding': 'Building',
      'cDormitory': 'Dormitory',
      'cPlaceOfBirth': 'Place of birth',
      'cNationality': 'Nationality',
      'cYearOfAdmission': 'Year of admission',
      'cFormingDivision': 'Forming division',
      'cIssuingDivision': 'Issuing division',
      'cTypeOfEducationalProgram': 'Type of educational program',
      'cDirectionOfTraining': 'Direction of training',
      'cSpeciality': 'Speciality',
      'cTypeOfCostRecovery': 'Type of cost recovery',
      'cQualificationGiven': 'Qualification given',
      'cStandardDevelopmentPeriod': 'Standard development period',
      'cFormOfLearning': 'Form of learning',
      'cTargetReception': 'Target reception',
      'cAge': 'Age',
      'cMale': 'Male',
      'cFemale': 'Female',
      'cOther': 'Other',
      'cIDStudent': 'ID Student',
      'cCourse': 'Course',
      'cStatus': 'Status',
      'cWelcomeBack': 'Welcome Back, ',
      'cWelcomeBackSubTitle': 'Make it work, make it right, make it fast.',
      'cLoginSubTitle':
          'Let\'s start your journey with us on this amazing and easy platform.',
      'cRes': 'Register',
      'cEmail': 'Email',
      'cPassword': 'Password',
      'cOldPassword': 'Old Password',
      'cNewPassword': 'New Password',
      'cReEnterNewPassword': 'Re-enter new Password',
      'cRememberMe': 'Remember me',
      'cForgotPassword': 'Forgot Password?',
      'cVerifyEmail': 'Verify Email',
      'cResetPassword': 'Reset Password',
      'cSignInWithGoogle': 'Sign-In with Google',
      'cSignUpWithGoogle': 'Sign-Up with Google',
      'cAlreadyHaveAnAccount': 'Already have an Account? ',
      'cAreYouAnAdmin': 'Are you an admin? ',
      'cAreYouAStudent': 'Are you a student? ',
      'cDoNotHaveAccount': 'Don\'t have Account? ',
      'cFullName': 'Full Name',
      'cForgotPasswordTitle': 'Make Selection!',
      'cForgotPasswordViaEmailSubTitle':
          'Enter your email address below and we will send you a link to reset your password.',
      'cAnEmailHasBeenSentToYou': 'An email has been sent to you.',
      'cCheckTheEmailToVerifyYourAccount':
          'Check the email to verify your account.',
      'cCheckTheEmailToChangePasswordYourAccount':
          'Check the email to change the password for your account.',
      'cForgotPasswordSubTitle':
          'Select one of the option given below to reset your password.',
      'cResetViaEmail': 'Reset via Email Verification.',
      'cResetViaPhone': 'Reset via Phone Verification.',
      'cForgotPasswordPhoneSubTitle':
          'Enter your registered Phone number to receive OTP',
      'cForgotPasswordEmailSubTitle':
          'Enter your registered Email number to receive OTP',
      'cNext': 'Next',
      'cOtpTitle': 'CO\nDE',
      'cOtpSubTitle': 'Verification',
      'cOtpMessage': 'Enter the verification code sent at ',
      'cDashboardHi': 'Hi',
      'cDashboardGroup': 'Group',
      'cDashboardHeading': 'Explore Courses',
      'cDashboardSearch': 'Search...',
      'cMyProfile': 'My Profile',
      'cStudyDetails': 'Study Details',
      'cStudySchedule': 'Study Schedule',
      'cTodayIs': 'Today is ',
      'cUniversityMap': 'University Map',
      'cFrequentlyAskedQuestions': 'Frequently Asked Questions (FAQs)',
      'cFAQs': 'FAQs',
      'cDashboardBannerSubTitle': '10 Lessons',
      'cViewAll': 'View All',
      'cGroupCurator': 'Group Curator',
      'cInstituteOfInternationalEducation':
          'Institute of International Education',
      'cInternationalStudentDepartment': 'International Student Department',
      'cProfile': 'Profile',
      'cProfileMenu': 'Profile Menu',
      'cEditProfile': 'Edit Profile',
      'cUpdateProfile': 'Update Profile',
      'cChangePassword': 'Change Password',
      'cLogout': 'Logout',
      'cMenu1': 'Settings',
      'cMenu2': 'Billing Details',
      'cMenu3': 'User Management',
      'cMenu4': 'Information',
      'cMenu5': 'Logout',
      'cDelete': 'Delete',
      'cJoinedAt': 'Joined at ',
      'cUpdatedAt': 'Updated at ',
      'cGeneralInformation': 'General Info',
      'cContact': 'Contact',
      'cStaff': 'Staff',
      'cIMO': 'IMO',
      'cReceptionHours': 'Reception Hours',
      'c918': ' 9:00 — 18:00',
      'c917': ' 9:00 — 17:00',
      'cAddress': 'Address',
      'cOffice': 'Office',
      'cPhone': 'Phone',
      'cExt': 'ext.',
      'cInfoTitle1': 'The main functions of the Institute',
      'cInfoTitle2': 'General Information about the Institute',
      'cInfoSubTitle1':
          'are to provide educational activities on the basis of educational and training programs of higher education for foreign citizens, involving: specialty programs, undergraduate programs, graduate programs specialization programs (different in educational levels, with various organizational forms (full-time, part-time, by correspondence, and different terms of study), as well as secondary special education programs.',
      'cInfoSubTitle2':
          'The Institute of International Education has been teaching foreign students in the areas and specialties of the University since its establishment in 1990 (until March 2015 it had the name the International Department of Informatics). The organization of the learning process for foreign undergraduate and graduate students is carried out by the Institutes training department. Training of foreign students for the development of undergraduate and graduate programs is carried out by the Pre-university Training Department for foreign citizens of the Institute. Training of foreign students and non-degree students is carried out both on contractual basis with payment of tuition fees by individuals or legal entities, and in accordance with the international treaties and intergovernmental agreements of the Russian Federation with the budget funds. To date, the Institute has gained a lot of experience in organizing the process of training foreign students which is based on the Russian state standards with the account of the specifics of the international education system. The institute has provided education and training to citizens of more than 80 countries. In accordance with higher education programs, foreign students study together with those from Russia. They actively participate in cultural events of the university, in university, city and international student competitions, have the opportunity to actively engage in sports and participate in sports competitions. Foreign students are actively involved in research work in graduating departments and student design bureaus. The topics of course projects and graduation works for foreign students are selected with the account of their professional interests and plans for working in their home countries. The most successful foreign students upon graduation receive ad valorem degrees. While studying at the university, foreign students get to know Moscow and its cultural traditions. Studying at the university is an important part of life for foreign students, a background for their future professional activity.',
      'cCuratorInfo': 'Curator Info',
      'cChatWithCurator': 'Chat With Curator',
      'cMessagingWithCurator': 'Messaging with Curator',
      'cSettings': 'Settings',
      'cAppearance': 'Appearance',
      'cLanguage': 'Language',
      'cDarkMode': 'Dark Mode',
      'cLightMode': 'Light Mode',
      'cEnglish': 'English',
      'cRussian': 'Russian',
      'cVietnamese': 'Vietnamese',
      'cOR': 'OR',
      'cMon': 'Mon',
      'cTue': 'Tue',
      'cWed': 'Wed',
      'cThu': 'Thu',
      'cFri': 'Fri',
      'cListOfAllStudents': 'List of all students',
      'cLoggingOut': 'Logging out',
      'cAreYouSure': 'Are you sure?',
      'cDeleteAllStudentData': 'Delete all student data!',
      'cYes': 'Yes',
      'cNo': 'No',
      'cUpdate': 'Update',
      'cTakeAPhoto': 'Take a photo',
      'cSelectAPhoto': 'Select a photo',
      'cStudentList': 'Student List',
      'cCuratorList': 'Curator List',
    },
    'ru': {
      'cAppName': 'MSA',
      'cAppNameDetailed': 'Адаптация студента МИРЭА',
      'cAppNameDiploma':
          'Мобильная информационная система\nдля адаптации иностранных студентов',
      'cCopyright': '© Ву Суан Кань - Проект MSA',
      'cHome': 'Главная',
      'c404': '404',
      'cGoBack': 'Назад',
      'cPageNotFoundTitle': 'Страница не найдена!',
      'cPageNotFoundSubTitle':
          'Извините, запрашиваемая страница не найдена или находится в процессе обслуживания. Пожалуйста, попробуйте еще раз позже!',
      'cLogin': 'Войти',
      'cBackToLogin': 'Вернуться к входу',
      'cSkipForNow': 'Пропустить',
      'cResendEmail': 'Отправить повторно',
      'cStudentLogin': 'Вход для студента',
      'cAdminLogin': 'Вход для администратора',
      'cStudentRegister': 'Регистрация студента',
      'cSignUp': 'Зарегистрироваться',
      'cPhoneNo': 'Номер телефона',
      'cGroup': 'Группа',
      'cGender': 'Пол',
      'cDateOfBirth': 'Дата рождения',
      'cShowAddress': 'Показать адрес',
      'cShowStudyDetails': 'Показать детали обучения',
      'cHideAddress': 'Скрыть адрес',
      'cHideStudyDetails': 'Скрыть детали обучения',
      'cCity': 'Город',
      'cStreet': 'Улица',
      'cHouse': 'Дом',
      'cBuilding': 'Строение',
      'cDormitory': 'Общежитие',
      'cPlaceOfBirth': 'Место рождения',
      'cNationality': 'Национальность',
      'cYearOfAdmission': 'Год поступления',
      'cFormingDivision': 'Формирующее подразделение',
      'cIssuingDivision': 'Выпускающее подразделение',
      'cTypeOfEducationalProgram': 'Тип образовательной программы',
      'cDirectionOfTraining': 'Направление подготовки',
      'cSpeciality': 'Специальность',
      'cTypeOfCostRecovery': 'Вид возмещения затрат',
      'cQualificationGiven': 'Присваиваеммая квалификация',
      'cStandardDevelopmentPeriod': 'Нормативный срок освоения',
      'cFormOfLearning': 'Форма освоения',
      'cTargetReception': 'Целевой прием',
      'cAge': 'Возраст',
      'cMale': 'Мужской',
      'cFemale': 'Женский',
      'cOther': 'Другой',
      'cIDStudent': 'Студ. билет №',
      'cCourse': 'Курс',
      'cStatus': 'Состояние',
      'cWelcomeBack': 'Добро пожаловать обратно,',
      'cWelcomeBackSubTitle':
          'Сделайте это работающим, сделайте это правильным, сделайте это быстрым.',
      'cLoginSubTitle':
          'Начните свое путешествие с нами на этой удивительной и простой платформе.',
      'cRes': 'Зарегистрироваться',
      'cEmail': 'Эл. почта',
      'cPassword': 'Пароль',
      'cOldPassword': 'Старый пароль',
      'cNewPassword': 'Новый пароль',
      'cReEnterNewPassword': 'Повторите новый пароль',
      'cRememberMe': 'Запомнить меня',
      'cForgotPassword': 'Забыли пароль?',
      'cVerifyEmail': 'Подтвердить Email',
      'cResetPassword': 'Сбросить пароль',
      'cSignInWithGoogle': 'Войти с помощью Google',
      'cSignUpWithGoogle': 'Зарегистрироваться с Google',
      'cAlreadyHaveAnAccount': 'Уже есть аккаунт? ',
      'cAreYouAnAdmin': 'Вы администратор? ',
      'cAreYouAStudent': 'Вы студент? ',
      'cDoNotHaveAccount': 'Нет аккаунта? ',
      'cFullName': 'ФИО',
      'cForgotPasswordTitle': 'Сделайте выбор!',
      'cForgotPasswordViaEmailSubTitle':
          'Введите ваш адрес электронной почты ниже, и мы отправим вам ссылку для сброса пароля.',
      'cAnEmailHasBeenSentToYou':
          'На ваш адрес электронной почты было отправлено письмо.',
      'cCheckTheEmailToVerifyYourAccount':
          'Проверьте электронную почту для подтверждения вашей учетной записи.',
      'cCheckTheEmailToChangePasswordYourAccount':
          'Проверьте электронную почту для смены пароля вашей учетной записи.',
      'cForgotPasswordSubTitle':
          'Выберите один из вариантов ниже, чтобы сбросить ваш пароль.',
      'cResetViaEmail': 'Сбросить через подтверждение электронной почты.',
      'cResetViaPhone': 'Сбросить через подтверждение телефона.',
      'cForgotPasswordPhoneSubTitle':
          'Введите ваш зарегистрированный номер телефона, чтобы получить ОТР',
      'cForgotPasswordEmailSubTitle':
          'Введите ваш зарегистрированный адрес электронной почты, чтобы получить ОТР',
      'cNext': 'Далее',
      'cOtpTitle': 'CO\nDE',
      'cOtpSubTitle': 'Подтверждение',
      'cOtpMessage': 'Введите код подтверждения, отправленный на',
      'cDashboardHi': 'Привет',
      'cDashboardGroup': 'Группа',
      'cDashboardHeading': 'Изучайте курсы',
      'cDashboardSearch': 'Поиск...',
      'cMyProfile': 'Мой профиль',
      'cStudyDetails': 'Детали',
      'cStudySchedule': 'Расписание',
      'cTodayIs': 'Сегодня ',
      'cUniversityMap': 'Карта',
      'cFrequentlyAskedQuestions': 'Часто задаваемые вопросы (ЧАВО)',
      'cFAQs': 'ЧАВО',
      'cDashboardBannerSubTitle': '10 уроков',
      'cViewAll': 'Показать все',
      'cGroupCurator': 'Куратор группы',
      'cInstituteOfInternationalEducation':
          'Институт международного образования',
      'cInternationalStudentDepartment': 'Отдел международных студентов',
      'cProfile': 'Профиль',
      'cProfileMenu': 'Меню профиля',
      'cEditProfile': 'Редактировать профиль',
      'cUpdateProfile': 'Обновить профиль',
      'cChangePassword': 'Изменить пароль',
      'cLogout': 'Выйти',
      'cMenu1': 'Настройки',
      'cMenu2': 'Платежные реквизиты',
      'cMenu3': 'Управление пользователями',
      'cMenu4': 'Информация',
      'cMenu5': 'Выйти',
      'cDelete': 'Удалить',
      'cJoinedAt': 'Зарегистрирован ',
      'cUpdatedAt': 'Обновлено ',
      'cGeneralInformation': 'Общая информация',
      'cContact': 'Контакты',
      'cStaff': 'Сотрудники',
      'cIMO': 'ИМО',
      'cReceptionHours': 'Часы приема',
      'c918': ' 9:00 — 18:00',
      'c917': ' 9:00 — 17:00',
      'cAddress': 'Адрес',
      'cOffice': 'ауд.',
      'cPhone': 'Телефон',
      'cExt': 'доб.',
      'cInfoTitle1': 'Основные функции института',
      'cInfoTitle2': 'Общая информация об институте',
      'cInfoSubTitle1':
          'заключаются в обеспечении образовательной деятельности на основе образовательных и учебных программ высшего образования для иностранных граждан, включая: специальные программы, программы бакалавриата, программы магистратуры программы специализации (различные по уровню образования, с различными формами организации (очная, заочная, дистанционная) и с различными сроками обучения), а также программы среднего профессионального образования.',
      'cInfoSubTitle2':
          'Институт международного образования начал преподавать иностранных студентов в областях и специальностях университета с момента своего создания в 1990 году (до марта 2015 года назывался Международный отдел информатики). Организацию учебного процесса для иностранных студентов бакалавриата и магистратуры осуществляет учебный отдел института. Подготовка иностранных студентов к освоению программ бакалавриата и магистратуры осуществляется Подготовительным отделением для иностранных граждан института. Обучение иностранных студентов и лиц без присвоения степени проводится как на договорной основе с оплатой обучения физическими или юридическими лицами, так и в соответствии с международными договорами и межправительственными соглашениями Российской Федерации за счет бюджетных средств. На сегодняшний день институт накопил значительный опыт в организации процесса подготовки иностранных студентов, основанный на российских государственных стандартах с учетом специфики системы международного образования. Институт оказывал образование и подготовку гражданам более 80 стран. В соответствии с программами высшего образования иностранные студенты учатся вместе с российскими студентами. Они активно участвуют в культурных мероприятиях университета, в университетских, городских и международных студенческих конкурсах, имеют возможность активно заниматься спортом и участвовать в спортивных соревнованиях. Иностранные студенты активно включены в научно-исследовательскую работу на выпускных кафедрах и студенческих проектных бюро. Темы курсовых и выпускных работ для иностранных студентов выбираются с учетом их профессиональных интересов и планов работы в родных странах. Самые успешные иностранные студенты при окончании получают дипломы с отличием. Во время обучения в университете иностранные студенты знакомятся с Москвой и ее культурными традициями. Обучение в университете является важной частью жизни для иностранных студентов, фоном для их будущей профессиональной деятельности.',
      'cCuratorInfo': 'Информация о кураторе',
      'cChatWithCurator': 'Чат с куратором',
      'cMessagingWithCurator': 'Обмен сообщениями с куратором',
      'cSettings': 'Настройки',
      'cAppearance': 'Внешний вид',
      'cLanguage': 'Язык',
      'cDarkMode': 'Темный режим',
      'cLightMode': 'Светлый режим',
      'cEnglish': 'Английский',
      'cRussian': 'Русский',
      'cVietnamese': 'Вьетнамский',
      'cOR': 'ИЛИ',
      'cMon': 'Пн',
      'cTue': 'Вт',
      'cWed': 'Ср',
      'cThu': 'Чт',
      'cFri': 'Пт',
      'cListOfAllStudents': 'Список всех студентов',
      'cLoggingOut': 'Выход из аккаунта',
      'cAreYouSure': 'Вы уверены?',
      'cDeleteAllStudentData': 'Удалить все данные о студентах!',
      'cYes': 'Да',
      'cNo': 'Нет',
      'cUpdate': 'Обновить',
      'cTakeAPhoto': 'Сделать фото',
      'cSelectAPhoto': 'Выбрать фото',
      'cStudentList': 'Список студентов',
      'cCuratorList': 'Список кураторов',
    },
    'vn': {
      'cAppName': 'MSA',
      'cAppNameDetailed': 'MIREA Student Adaptation',
      'cAppNameDiploma':
      'Hệ thống thông tin di động\ngiúp sinh viên ngoại quốc\nthích ứng ở trường đại học',
      'cCopyright': '© Vu Xuan Canh - Project MSA',
      'cHome': 'Trang chủ',
      'c404': '404',
      'cGoBack': 'Quay lại',
      'cPageNotFoundTitle': 'Không tìm thấy trang!',
      'cPageNotFoundSubTitle':
      'Xin lỗi, trang bạn yêu cầu không thể tìm thấy hoặc hiện đang trong quá trình bảo trì. Vui lòng thử lại sau!',
      'cLogin': 'Đăng nhập',
      'cBackToLogin': 'Quay lại đăng nhập',
      'cSkipForNow': 'Bỏ qua',
      'cResendEmail': 'Gửi lại một Email mới',
      'cStudentLogin': 'Đăng nhập - Sinh viên',
      'cAdminLogin': 'Đăng nhập - Quản trị viên',
      'cStudentRegister': 'Đăng ký - Sinh viên',
      'cSignUp': 'Đăng ký',
      'cPhoneNo': 'Số điện thoại',
      'cGroup': 'Nhóm',
      'cGender': 'Giới tính',
      'cDateOfBirth': 'Ngày sinh',
      'cShowAddress': 'Hiển thị Địa chỉ',
      'cShowStudyDetails': 'Hiển thị hồ sơ',
      'cHideAddress': 'Ẩn Địa chỉ',
      'cHideStudyDetails': 'Ẩn hồ sơ',
      'cCity': 'Thành phố',
      'cStreet': 'Đường',
      'cHouse': 'Số nhà',
      'cBuilding': 'Toà nhà',
      'cDormitory': 'Ký túc xá',
      'cPlaceOfBirth': 'Nơi sinh',
      'cNationality': 'Quốc tịch',
      'cYearOfAdmission': 'Năm nhập học',
      'cFormingDivision': 'Bộ phận hình thành',
      'cIssuingDivision': 'Bộ phận cấp phát',
      'cTypeOfEducationalProgram': 'Loại chương trình giáo dục',
      'cDirectionOfTraining': 'Hướng đào tạo',
      'cSpeciality': 'Chuyên ngành',
      'cTypeOfCostRecovery': 'Loại thu hồi chi phí',
      'cQualificationGiven': 'Bằng cấp được cấp',
      'cStandardDevelopmentPeriod': 'Thời gian đào tạo',
      'cFormOfLearning': 'Hình thức học',
      'cTargetReception': 'Tiếp nhận mục tiêu',
      'cAge': 'Tuổi',
      'cMale': 'Nam',
      'cFemale': 'Nữ',
      'cOther': 'Khác',
      'cIDStudent': 'MSSV',
      'cCourse': 'Khoá học',
      'cStatus': 'Trạng thái',
      'cWelcomeBack': 'Chào mừng trở lại, ',
      'cWelcomeBackSubTitle': 'Make it work, make it right, make it fast.',
      'cLoginSubTitle':
      'Let\'s start your journey with us on this amazing and easy platform.',
      'cRes': 'Đăng ký',
      'cEmail': 'Email',
      'cPassword': 'Mật khẩu',
      'cOldPassword': 'Mật khẩu cũ',
      'cNewPassword': 'Mật khẩu mới',
      'cReEnterNewPassword': 'Nhập lại mật khẩu mới',
      'cRememberMe': 'Lưu tài khoản',
      'cForgotPassword': 'Quên mật khẩu?',
      'cVerifyEmail': 'Xác nhận Email',
      'cResetPassword': 'Reset mật khẩu',
      'cSignInWithGoogle': 'Đăng nhập bằng Google',
      'cSignUpWithGoogle': 'Đăng ký bằng Google',
      'cAlreadyHaveAnAccount': 'Đã có tài khoản? ',
      'cAreYouAnAdmin': 'Bạn là quản trị viên? ',
      'cAreYouAStudent': 'Bạn là sinh viên? ',
      'cDoNotHaveAccount': 'Không có tài khoản? ',
      'cFullName': 'Tên đầy đủ',
      'cForgotPasswordTitle': 'Chọn hành động!',
      'cForgotPasswordViaEmailSubTitle':
      'Nhập email của bạn và chúng tôi sẽ gửi liên kết để khôi phục mật khẩu.',
      'cAnEmailHasBeenSentToYou': 'Một tin nhắn đã được gửi đến Email của bạn.',
      'cCheckTheEmailToVerifyYourAccount':
      'Kiểm tra email để xác nhận tài khoản.',
      'cCheckTheEmailToChangePasswordYourAccount':
      'Kiểm tra email để thay đổi mật khẩu của bạn.',
      'cForgotPasswordSubTitle':
      'Chọn một hành động ở dưới để reset mật khẩu của bạn.',
      'cResetViaEmail': 'Reset mật khẩu bằng Email.',
      'cResetViaPhone': 'Reset mật khẩu bằng SĐT.',
      'cForgotPasswordPhoneSubTitle':
      'Nhập SĐT đã đăng ký của bạn để nhận mã OTP',
      'cForgotPasswordEmailSubTitle':
      'Nhập Email đã đăng ký của bạn để nhận mã OTP',
      'cNext': 'Tiếp theo',
      'cOtpTitle': 'CO\nDE',
      'cOtpSubTitle': 'Xác thực',
      'cOtpMessage': 'Nhập mã xác thực được gửi tại ',
      'cDashboardHi': 'Chào',
      'cDashboardGroup': 'Nhóm',
      'cDashboardHeading': 'Explore Courses',
      'cDashboardSearch': 'Search...',
      'cMyProfile': 'Profile của tôi',
      'cStudyDetails': 'Hồ sơ',
      'cStudySchedule': 'Lịch học',
      'cTodayIs': 'Hôm này là ',
      'cUniversityMap': 'Bản đồ ĐH',
      'cFrequentlyAskedQuestions': 'Câu hỏi thường gặp (FAQs)',
      'cFAQs': 'FAQs',
      'cDashboardBannerSubTitle': '10 Lessons',
      'cViewAll': 'Xem tất cả',
      'cGroupCurator': 'Người phụ trách nhóm',
      'cInstituteOfInternationalEducation':
      'Viện giáo dục quốc tế',
      'cInternationalStudentDepartment': 'Phòng sinh viên quốc tế',
      'cProfile': 'Profile',
      'cProfileMenu': 'Profile Menu',
      'cEditProfile': 'Sửa Profile',
      'cUpdateProfile': 'Cập nhật Profile',
      'cChangePassword': 'Thay đổi mật khẩu',
      'cLogout': 'Đăng xuất',
      'cMenu1': 'Cài đặt',
      'cMenu2': 'Billing Details',
      'cMenu3': 'Quản lý người dùng',
      'cMenu4': 'Thông tin',
      'cMenu5': 'Đăng xuất',
      'cDelete': 'Xoá',
      'cJoinedAt': 'Tham gia lúc ',
      'cUpdatedAt': 'Cập nhật lúc ',
      'cGeneralInformation': 'Thông tin chung',
      'cContact': 'Liên hệ',
      'cStaff': 'Nhân viên',
      'cIMO': 'IMO',
      'cReceptionHours': 'Giờ làm việc',
      'c918': ' 9:00 — 18:00',
      'c917': ' 9:00 — 17:00',
      'cAddress': 'Địa chỉ',
      'cOffice': 'Văn phòng',
      'cPhone': 'SĐT',
      'cExt': 'ext.',
      'cInfoTitle1': 'Các chức năng chính của Viện',
      'cInfoTitle2': 'Thông tin chung về Viện',
      'cInfoSubTitle1':
      'là cung cấp các hoạt động giáo dục trên cơ sở các chương trình giáo dục và đào tạo giáo dục đại học cho công dân nước ngoài, bao gồm: chương trình chuyên ngành, chương trình đại học, chương trình sau đại học chương trình chuyên ngành (khác nhau về trình độ học vấn, với các hình thức tổ chức khác nhau (toàn thời gian, bán thời gian). thời gian, qua thư từ, và các điều khoản học tập khác nhau), cũng như các chương trình giáo dục đặc biệt cấp trung học.',
      'cInfoSubTitle2':
      'Viện Đào tạo Quốc tế đã giảng dạy cho sinh viên nước ngoài trong các lĩnh vực và chuyên ngành của Trường kể từ khi thành lập năm 1990 (đến tháng 3 năm 2015, nó có tên là Khoa Tin học Quốc tế). Việc tổ chức quá trình học tập cho sinh viên đại học và sau đại học nước ngoài do phòng đào tạo của Viện thực hiện. Việc đào tạo sinh viên nước ngoài để phát triển chương trình đại học và sau đại học do Phòng Đào tạo dự bị đại học cho công dân nước ngoài của Viện thực hiện. Việc đào tạo sinh viên nước ngoài và sinh viên không cấp bằng được thực hiện trên cơ sở hợp đồng với việc thanh toán học phí của cá nhân hoặc pháp nhân, và phù hợp với các điều ước quốc tế và thỏa thuận liên chính phủ của Liên bang Nga bằng ngân sách. Đến nay, Viện đã có nhiều kinh nghiệm trong việc tổ chức quá trình đào tạo sinh viên nước ngoài dựa trên các tiêu chuẩn của nhà nước Nga có tính đến các đặc thù của hệ thống giáo dục quốc tế. Viện đã cung cấp giáo dục và đào tạo cho công dân của hơn 80 quốc gia. Theo các chương trình giáo dục đại học, sinh viên nước ngoài học cùng với những người đến từ Nga. Họ tích cực tham gia các sự kiện văn hóa của trường, trong các cuộc thi cấp trường, thành phố và sinh viên quốc tế, có cơ hội tích cực tham gia các môn thể thao và tham gia các cuộc thi thể thao. Sinh viên nước ngoài tích cực tham gia vào công việc nghiên cứu tại các khoa tốt nghiệp và văn phòng thiết kế sinh viên. Các chủ đề của dự án khóa học và công việc tốt nghiệp cho sinh viên nước ngoài được lựa chọn với tài khoản về sở thích nghề nghiệp và kế hoạch làm việc tại nước sở tại của họ. Các sinh viên nước ngoài thành công nhất khi tốt nghiệp nhận được bằng cấp giá trị. Trong khi học tại trường đại học, sinh viên nước ngoài làm quen với Moscow và truyền thống văn hóa của nó. Học tập tại trường đại học là một phần quan trọng trong cuộc sống của sinh viên nước ngoài, là nền tảng cho hoạt động nghề nghiệp trong tương lai của họ.',
      'cCuratorInfo': 'Thông tin người phụ trách',
      'cChatWithCurator': 'Trò chuyện với người phụ trách',
      'cMessagingWithCurator': 'Nhắn tin với người phụ trách',
      'cSettings': 'Cài đặt',
      'cAppearance': 'Giao diện',
      'cLanguage': 'Ngôn ngữ',
      'cDarkMode': 'Chế độ tối',
      'cLightMode': 'Chế độ sáng',
      'cEnglish': 'Tiếng Anh',
      'cRussian': 'Tiếng Nga',
      'cVietnamese': 'Tiếng Việt',
      'cOR': 'HOẶC',
      'cMon': 'T2',
      'cTue': 'T3',
      'cWed': 'T4',
      'cThu': 'T5',
      'cFri': 'T6',
      'cListOfAllStudents': 'Danh sách sinh viên',
      'cLoggingOut': 'Đang đăng xuất',
      'cAreYouSure': 'Bạn có chắc chắn?',
      'cDeleteAllStudentData': 'Xoá tất cả dữ liệu của sinh viên!',
      'cYes': 'Đồng ý',
      'cNo': 'Không',
      'cUpdate': 'Cập nhật',
      'cTakeAPhoto': 'Chụp ảnh',
      'cSelectAPhoto': 'Chọn ảnh',
      'cStudentList': 'Danh sách SV',
      'cCuratorList': 'Danh sách PT',
    },
  };

  static String getTranslation(String key, String languageCode) {
    return _localizedValues[languageCode]![key] ?? '';
  }

  static set language(String lang) {
    defaultLanguage = lang;
  }

  static String get cAppName {
    return _localizedValues[defaultLanguage]!['cAppName']!;
  }

  static String get cAppNameDetailed {
    return _localizedValues[defaultLanguage]!['cAppNameDetailed']!;
  }

  static String get cAppNameDiploma {
    return _localizedValues[defaultLanguage]!['cAppNameDiploma']!;
  }

  static String get cHome {
    return _localizedValues[defaultLanguage]!['cHome']!;
  }

  static String get c404 {
    return _localizedValues[defaultLanguage]!['c404']!;
  }

  static String get cGoBack {
    return _localizedValues[defaultLanguage]!['cGoBack']!;
  }

  static String get cPageNotFoundTitle {
    return _localizedValues[defaultLanguage]!['cPageNotFoundTitle']!;
  }

  static String get cPageNotFoundSubTitle {
    return _localizedValues[defaultLanguage]!['cPageNotFoundSubTitle']!;
  }
  static String get cLogin {
    return _localizedValues[defaultLanguage]!['cLogin']!;
  }

  static String get cBackToLogin {
    return _localizedValues[defaultLanguage]!['cBackToLogin']!;
  }

  static String get cSkipForNow {
    return _localizedValues[defaultLanguage]!['cSkipForNow']!;
  }

  static String get cResendEmail {
    return _localizedValues[defaultLanguage]!['cResendEmail']!;
  }

  static String get cStudentLogin {
    return _localizedValues[defaultLanguage]!['cStudentLogin']!;
  }

  static String get cAdminLogin {
    return _localizedValues[defaultLanguage]!['cAdminLogin']!;
  }

  static String get cStudentRegister {
    return _localizedValues[defaultLanguage]!['cStudentRegister']!;
  }

  static String get cSignUp {
    return _localizedValues[defaultLanguage]!['cSignUp']!;
  }

  static String get cPhoneNo {
    return _localizedValues[defaultLanguage]!['cPhoneNo']!;
  }

  static String get cGroup {
    return _localizedValues[defaultLanguage]!['cGroup']!;
  }

  static String get cGender {
    return _localizedValues[defaultLanguage]!['cGender']!;
  }

  static String get cDateOfBirth {
    return _localizedValues[defaultLanguage]!['cDateOfBirth']!;
  }

  static String get cShowAddress {
    return _localizedValues[defaultLanguage]!['cShowAddress']!;
  }

  static String get cShowStudyDetails {
    return _localizedValues[defaultLanguage]!['cShowStudyDetails']!;
  }

  static String get cHideAddress {
    return _localizedValues[defaultLanguage]!['cHideAddress']!;
  }

  static String get cHideStudyDetails {
    return _localizedValues[defaultLanguage]!['cHideStudyDetails']!;
  }

  static String get cCity {
    return _localizedValues[defaultLanguage]!['cCity']!;
  }

  static String get cStreet {
    return _localizedValues[defaultLanguage]!['cStreet']!;
  }

  static String get cHouse {
    return _localizedValues[defaultLanguage]!['cHouse']!;
  }

  static String get cBuilding {
    return _localizedValues[defaultLanguage]!['cBuilding']!;
  }

  static String get cDormitory {
    return _localizedValues[defaultLanguage]!['cDormitory']!;
  }

  static String get cPlaceOfBirth {
    return _localizedValues[defaultLanguage]!['cPlaceOfBirth']!;
  }

  static String get cNationality {
    return _localizedValues[defaultLanguage]!['cNationality']!;
  }

  static String get cYearOfAdmission {
    return _localizedValues[defaultLanguage]!['cYearOfAdmission']!;
  }

  static String get cFormingDivision {
    return _localizedValues[defaultLanguage]!['cFormingDivision']!;
  }

  static String get cIssuingDivision {
    return _localizedValues[defaultLanguage]!['cIssuingDivision']!;
  }

  static String get cTypeOfEducationalProgram {
    return _localizedValues[defaultLanguage]!['cTypeOfEducationalProgram']!;
  }

  static String get cDirectionOfTraining {
    return _localizedValues[defaultLanguage]!['cDirectionOfTraining']!;
  }

  static String get cSpeciality {
    return _localizedValues[defaultLanguage]!['cSpeciality']!;
  }

  static String get cTypeOfCostRecovery {
    return _localizedValues[defaultLanguage]!['cTypeOfCostRecovery']!;
  }

  static String get cQualificationGiven {
    return _localizedValues[defaultLanguage]!['cQualificationGiven']!;
  }

  static String get cStandardDevelopmentPeriod {
    return _localizedValues[defaultLanguage]!['cStandardDevelopmentPeriod']!;
  }

  static String get cFormOfLearning {
    return _localizedValues[defaultLanguage]!['cFormOfLearning']!;
  }

  static String get cTargetReception {
    return _localizedValues[defaultLanguage]!['cTargetReception']!;
  }

  static String get cAge {
    return _localizedValues[defaultLanguage]!['cAge']!;
  }

  static String get cMale {
    return _localizedValues[defaultLanguage]!['cMale']!;
  }

  static String get cFemale {
    return _localizedValues[defaultLanguage]!['cFemale']!;
  }

  static String get cOther {
    return _localizedValues[defaultLanguage]!['cOther']!;
  }

  static String get cIDStudent {
    return _localizedValues[defaultLanguage]!['cIDStudent']!;
  }

  static String get cCourse {
    return _localizedValues[defaultLanguage]!['cCourse']!;
  }

  static String get cStatus {
    return _localizedValues[defaultLanguage]!['cStatus']!;
  }

  static String get cWelcomeBack {
    return _localizedValues[defaultLanguage]!['cWelcomeBack']!;
  }

  static String get cWelcomeBackSubTitle {
    return _localizedValues[defaultLanguage]!['cWelcomeBackSubTitle']!;
  }

  static String get cLoginSubTitle {
    return _localizedValues[defaultLanguage]!['cLoginSubTitle']!;
  }


  static String get cRes {
    return _localizedValues[defaultLanguage]!['cRes']!;
  }

  static String get cEmail {
    return _localizedValues[defaultLanguage]!['cEmail']!;
  }

  static String get cPassword {
    return _localizedValues[defaultLanguage]!['cPassword']!;
  }

  static String get cOldPassword {
    return _localizedValues[defaultLanguage]!['cOldPassword']!;
  }

  static String get cNewPassword {
    return _localizedValues[defaultLanguage]!['cNewPassword']!;
  }

  static String get cReEnterNewPassword {
    return _localizedValues[defaultLanguage]!['cReEnterNewPassword']!;
  }

  static String get cRememberMe {
    return _localizedValues[defaultLanguage]!['cRememberMe']!;
  }

  static String get cForgotPassword {
    return _localizedValues[defaultLanguage]!['cForgotPassword']!;
  }

  static String get cVerifyEmail {
    return _localizedValues[defaultLanguage]!['cVerifyEmail']!;
  }

  static String get cResetPassword {
    return _localizedValues[defaultLanguage]!['cResetPassword']!;
  }

  static String get cSignInWithGoogle {
    return _localizedValues[defaultLanguage]!['cSignInWithGoogle']!;
  }

  static String get cSignUpWithGoogle {
    return _localizedValues[defaultLanguage]!['cSignUpWithGoogle']!;
  }

  static String get cAlreadyHaveAnAccount {
    return _localizedValues[defaultLanguage]!['cAlreadyHaveAnAccount']!;
  }

  static String get cAreYouAnAdmin {
    return _localizedValues[defaultLanguage]!['cAreYouAnAdmin']!;
  }

  static String get cAreYouAStudent {
    return _localizedValues[defaultLanguage]!['cAreYouAStudent']!;
  }

  static String get cDoNotHaveAccount {
    return _localizedValues[defaultLanguage]!['cDoNotHaveAccount']!;
  }

  static String get cFullName {
    return _localizedValues[defaultLanguage]!['cFullName']!;
  }

  static String get cForgotPasswordTitle {
    return _localizedValues[defaultLanguage]!['cForgotPasswordTitle']!;
  }

  static String get cForgotPasswordViaEmailSubTitle {
    return _localizedValues[defaultLanguage]![
    'cForgotPasswordViaEmailSubTitle']!;
  }

  static String get cAnEmailHasBeenSentToYou {
    return _localizedValues[defaultLanguage]!['cAnEmailHasBeenSentToYou']!;
  }

  static String get cCheckTheEmailToVerifyYourAccount {
    return _localizedValues[defaultLanguage]![
    'cCheckTheEmailToVerifyYourAccount']!;
  }

  static String get cCheckTheEmailToChangePasswordYourAccount {
    return _localizedValues[defaultLanguage]![
    'cCheckTheEmailToChangePasswordYourAccount']!;
  }

  static String get cForgotPasswordSubTitle {
    return _localizedValues[defaultLanguage]!['cForgotPasswordSubTitle']!;
  }

  static String get cResetViaEmail {
    return _localizedValues[defaultLanguage]!['cResetViaEmail']!;
  }

  static String get cResetViaPhone {
    return _localizedValues[defaultLanguage]!['cResetViaPhone']!;
  }

  static String get cForgotPasswordPhoneSubTitle {
    return _localizedValues[defaultLanguage]!['cForgotPasswordPhoneSubTitle']!;
  }

  static String get cForgotPasswordEmailSubTitle {
    return _localizedValues[defaultLanguage]!['cForgotPasswordEmailSubTitle']!;
  }

  static String get cNext {
    return _localizedValues[defaultLanguage]!['cNext']!;
  }

  static String get cOtpTitle {
    return _localizedValues[defaultLanguage]!['cOtpTitle']!;
  }

  static String get cOtpSubTitle {
    return _localizedValues[defaultLanguage]!['cOtpSubTitle']!;
  }

  static String get cOtpMessage {
    return _localizedValues[defaultLanguage]!['cOtpMessage']!;
  }

  static String get cDashboardHi {
    return _localizedValues[defaultLanguage]!['cDashboardHi']!;
  }

  static String get cDashboardGroup {
    return _localizedValues[defaultLanguage]!['cDashboardGroup']!;
  }

  static String get cDashboardHeading {
    return _localizedValues[defaultLanguage]!['cDashboardHeading']!;
  }

  static String get cDashboardSearch {
    return _localizedValues[defaultLanguage]!['cDashboardSearch']!;
  }

  static String get cMyProfile {
    return _localizedValues[defaultLanguage]!['cMyProfile']!;
  }

  static String get cStudyDetails {
    return _localizedValues[defaultLanguage]!['cStudyDetails']!;
  }

  static String get cStudySchedule {
    return _localizedValues[defaultLanguage]!['cStudySchedule']!;
  }

  static String get cTodayIs {
    return _localizedValues[defaultLanguage]!['cTodayIs']!;
  }

  static String get cUniversityMap {
    return _localizedValues[defaultLanguage]!['cUniversityMap']!;
  }

  static String get cFrequentlyAskedQuestions {
    return _localizedValues[defaultLanguage]!['cFrequentlyAskedQuestions']!;
  }

  static String get cFAQs {
    return _localizedValues[defaultLanguage]!['cFAQs']!;
  }

  static String get cDashboardBannerSubTitle {
    return _localizedValues[defaultLanguage]!['cDashboardBannerSubTitle']!;
  }

  static String get cViewAll {
    return _localizedValues[defaultLanguage]!['cViewAll']!;
  }

  static String get cGroupCurator {
    return _localizedValues[defaultLanguage]!['cGroupCurator']!;
  }

  static String get cInstituteOfInternationalEducation {
    return _localizedValues[defaultLanguage]![
    'cInstituteOfInternationalEducation']!;
  }

  static String get cInternationalStudentDepartment {
    return _localizedValues[defaultLanguage]![
    'cInternationalStudentDepartment']!;
  }



  static String get cProfile {
    return _localizedValues[defaultLanguage]!['cProfile']!;
  }

  static String get cProfileMenu {
    return _localizedValues[defaultLanguage]!['cProfileMenu']!;
  }

  static String get cEditProfile {
    return _localizedValues[defaultLanguage]!['cEditProfile']!;
  }

  static String get cUpdateProfile {
    return _localizedValues[defaultLanguage]!['cUpdateProfile']!;
  }

  static String get cChangePassword {
    return _localizedValues[defaultLanguage]!['cChangePassword']!;
  }

  static String get cLogout {
    return _localizedValues[defaultLanguage]!['cLogout']!;
  }

  static String get cMenu1 {
    return _localizedValues[defaultLanguage]!['cMenu1']!;
  }

  static String get cMenu2 {
    return _localizedValues[defaultLanguage]!['cMenu2']!;
  }

  static String get cMenu3 {
    return _localizedValues[defaultLanguage]!['cMenu3']!;
  }

  static String get cMenu4 {
    return _localizedValues[defaultLanguage]!['cMenu4']!;
  }

  static String get cMenu5 {
    return _localizedValues[defaultLanguage]![cLogout]!;
  }

  static String get cDelete {
    return _localizedValues[defaultLanguage]!['cDelete']!;
  }

  static String get cJoinedAt {
    return _localizedValues[defaultLanguage]!['cJoinedAt']!;
  }

  static String get cUpdatedAt {
    return _localizedValues[defaultLanguage]!['cUpdatedAt']!;
  }

  static String get cGeneralInformation {
    return _localizedValues[defaultLanguage]!['cGeneralInformation']!;
  }

  static String get cContact {
    return _localizedValues[defaultLanguage]!['cContact']!;
  }

  static String get cStaff {
    return _localizedValues[defaultLanguage]!['cStaff']!;
  }

  static String get cIMO {
    return _localizedValues[defaultLanguage]!['cIMO']!;
  }

  static String get cReceptionHours {
    return _localizedValues[defaultLanguage]!['cReceptionHours']!;
  }

  static String get c918 {
    return _localizedValues[defaultLanguage]!['c918']!;
  }

  static String get c917 {
    return _localizedValues[defaultLanguage]!['c917']!;
  }

  static String get cAddress {
    return _localizedValues[defaultLanguage]!['cAddress']!;
  }

  static String get cOffice {
    return _localizedValues[defaultLanguage]!['cOffice']!;
  }

  static String get cPhone {
    return _localizedValues[defaultLanguage]!['cPhone']!;
  }

  static String get cExt {
    return _localizedValues[defaultLanguage]!['cExt']!;
  }

  static String get cInfoTitle1 {
    return _localizedValues[defaultLanguage]!['cInfoTitle1']!;
  }

  static String get cInfoTitle2 {
    return _localizedValues[defaultLanguage]!['cInfoTitle2']!;
  }

  static String get cInfoSubTitle1 {
    return _localizedValues[defaultLanguage]!['cInfoSubTitle1']!;
  }

  static String get cInfoSubTitle2 {
    return _localizedValues[defaultLanguage]!['cInfoSubTitle2']!;
  }

  static String get cCuratorInfo {
    return _localizedValues[defaultLanguage]!['cCuratorInfo']!;
  }

  static String get cChatWithCurator {
    return _localizedValues[defaultLanguage]!['cChatWithCurator']!;
  }

  static String get cMessagingWithCurator {
    return _localizedValues[defaultLanguage]!['cMessagingWithCurator']!;
  }

  static String get curatorInfo {
    return _localizedValues[defaultLanguage]!['cCuratorInfo']!;
  }

  static String get chatWithCurator {
    return _localizedValues[defaultLanguage]!['cChatWithCurator']!;
  }

  static String get messagingWithCurator {
    return _localizedValues[defaultLanguage]!['cMessagingWithCurator']!;
  }

  static String get cSettings {
    return _localizedValues[defaultLanguage]!['cSettings']!;
  }

  static String get cAppearance {
    return _localizedValues[defaultLanguage]!['cAppearance']!;
  }

  static String get cLanguage {
    return _localizedValues[defaultLanguage]!['cLanguage']!;
  }

  static String get cDarkMode {
    return _localizedValues[defaultLanguage]!['cDarkMode']!;
  }

  static String get cLightMode {
    return _localizedValues[defaultLanguage]!['cLightMode']!;
  }

  static String get cEnglish {
    return _localizedValues[defaultLanguage]!['cEnglish']!;
  }

  static String get cRussian {
    return _localizedValues[defaultLanguage]!['cRussian']!;
  }

  static String get cVietnamese {
    return _localizedValues[defaultLanguage]!['cVietnamese']!;
  }

  static String get cCopyright {
    return _localizedValues[defaultLanguage]!['cCopyright']!;
  }

  static String get cOR {
    return _localizedValues[defaultLanguage]!['cOR']!;
  }

  static String get cMon {
    return _localizedValues[defaultLanguage]!['cMon']!;
  }
  static String get cTue {
    return _localizedValues[defaultLanguage]!['cTue']!;
  }
  static String get cWed {
    return _localizedValues[defaultLanguage]!['cWed']!;
  }
  static String get cThu {
    return _localizedValues[defaultLanguage]!['cThu']!;
  }
  static String get cFri {
    return _localizedValues[defaultLanguage]!['cFri']!;
  }
  static String get cListOfAllStudents {
    return _localizedValues[defaultLanguage]!['cListOfAllStudents']!;
  }
  static String get cLoggingOut {
    return _localizedValues[defaultLanguage]!['cLoggingOut']!;
  }
  static String get cAreYouSure {
    return _localizedValues[defaultLanguage]!['cAreYouSure']!;
  }
  static String get cDeleteAllStudentData {
    return _localizedValues[defaultLanguage]!['cDeleteAllStudentData']!;
  }
  static String get cYes {
    return _localizedValues[defaultLanguage]!['cYes']!;
  }
  static String get cNo {
    return _localizedValues[defaultLanguage]!['cNo']!;
  }
  static String get cUpdate {
    return _localizedValues[defaultLanguage]!['cUpdate']!;
  }
  static String get cTakeAPhoto {
    return _localizedValues[defaultLanguage]!['cTakeAPhoto']!;
  }
  static String get cSelectAPhoto {
    return _localizedValues[defaultLanguage]!['cSelectAPhoto']!;
  }
  static String get cStudentList {
    return _localizedValues[defaultLanguage]!['cStudentList']!;
  }
  static String get cCuratorList {
    return _localizedValues[defaultLanguage]!['cCuratorList']!;
  }
}
