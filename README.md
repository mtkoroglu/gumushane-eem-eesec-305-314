# EESEC 314
## 1. Hafta
**Dinamik sistem** nedir? **Hafızalı sistem**.
Gerilim kaynağı bağlanmış bir resistör-kapasitör devresini (RC devresi - **Şekil 1**) analiz ettik. Burdaki örnekte kapasitörün üzerinden geçen akım değil de kapasitörün üzerine düşen voltaj hafıza işlevi görüyor. Hafızaya **durum değişkeni** diyeceğiz.</br>
**Durum değişkeni:** *Geçmişin geleceği etkileyen özü*.</br>
Bu hafta baktığımız RC devresinin durum uzayı modelinde bir tane **durum değişkeni** var, dolayısıyla bir boyutlu bir sistem. Ayrıca *Vcc* olarak isimlendirdiğimiz gerilim kaynağı, sistemin **durum değişkeni** olan **kapasitör voltajına** bir **giriş değişkeni** (input variable) olarak etki ediyor. RC devresinde gerilim kaynağının voltajı *V<sub>cc</sub>*, resistör değeri *R* ve kapasitor değeri *C* sistem parametreleri olarak vazife yapıyor. Bu parametreler zamanla değişmediği zaman Sinyaller-Sistemler dersinden bildiğimiz gibi doğrusal zamanla değişmeyen (linear time-invariant - LTI) bir sistemimiz olmuş oluyor ve analiz etmek kolay bir hal alıyor. Sistem parametrelerimiz zamanla değişen bir yapıya sahipse daha kompleks matematiksel yaklaşımlarla analiz yapmak zorunda kalırız.

<img src="şekil/RC devresi basamak cevabı.jpg" alt="RC devresi." height="360"/>

*Şekil 1:* RC devresi.

## 2. Hafta 
Pendulum dinamiklerine [1] durum uzayında (state space) bakış. *Şekil 2*'de görüldüğü üzere, kütlesi ihmal edilen *l* uzunluğundaki çubuğun ucundaki cismin kütlesi *m*, sürtünme katsayısı *b*, yer çekimi ivmesi *g*; sistem parametreleri denilen bu katsayılar sabit (i.e., zamanla değişmiyor). Sistemin durum değişkenleri açı ve açısal hız. Çıkış değişkeni olarak da açıyı gözlemliyoruz. Burda analiz ettiğimiz pendulum probleminde sistemimizin bir girişi yok. Gerçek hayatta çubuğun ucuna pervaneli bir motor takılıp çubuğu hareket ettirebilir veya çubuğun baş noktasında (yani döndüğü yer) bir step veya servo motor pendulumu döndürebilir. Motorların dönmesiyle sisteme etki edecek olan kuvvet sistemimize bir giriş olarak etki edecektir.

<img src="şekil/pendulum.png" alt="Pendulum dinamikleri." height="240"/>

*Şekil 2:* Pendulum modeli ([1]'in izni ile).
## 3. Hafta
Bir araba için **cruise control** (otomatik hız kontrolü) dinamiklerine bakış. Durum uzayı gösterimi (state space representation). Bu hafta ayrıca oransal-integral-türevsel (proportional-integral-derivative) denetleyici (PID controller) tasarlayarak (deneme-yanılma yolu ile) arabamızın hız kontrolünü yaptık. İlgili video DBS'de.

<img src="şekil/cruise_control.png" alt="Pendulum dinamikleri." height="240"/>

*Şekil 3:* Araba hız kontrolü (cruise control) modeli ([2]'nin izni ile).
## 4. Hafta
Cruise control problemine bakmaya devam ettik. A matrisi sistem matrisimiz, B matrisi giriş matrisi, C matrisi çıkış matrisi olarak isimlendiriliyor. Eğer bir sistemin dinamikleri doğrusal (linear) ise o zaman sistemin zaman alanındaki (time-domain) modelini yukarıda bahsedilen matrisler ve giriş, durum ve çıkış değişkenleri cinsinden **durum uzayı gösterimi** (state space representation) ile tasvir edebiliriz. Bu hafta zaman alanından (time domain) frekans alanına (s domain) geçiş yaptık. Sistemimizin çıkışı (y(t)) olan arabamızın hızı (v(t)) ile girişi (u(t)) olan arabayı çeken kuvvet arasındaki orana s alanında (s-domain) bakarsak transfer fonksiyonu T(s)'yi elde ediyoruz.

T(s) = Y(s)/U(s) = C(sI-A)<sup>-1</sup>B + D

Dersimizin sonunda her hafta yaptığımız gibi MATLAB/Simulink'de teoriklerine baktığımız modellerin simulasyonlarını yaptık. Durum uzayındaki çıkış değişkeni olan arabanın hızının, s-alanında Transfer fonksiyonu ile verilen bloğun çıkışı olan hız değişkeni ile tamamen aynı olduğunu gözlemledik. Dersimizi önümüzdeki hafta sistemin çıkışını hız değil de pozisyon (arabanın konumu) olarak seçip yeni bir transfer fonksiyonu elde edeceğiz diye sonlandırdık.
## 5. Hafta
Cruise kontrol problemindeki arabanın dinamikleriyle (*Şekil 3*) devam ettik. Çıkış olarak hızı değil de pozisyonu seçerek konum bilgisinden geri-besleme aldık. Böylece sistemimizin transfer fonksiyonu da değişmiş oldu. Hatırlayacak olursak **transfer fonksiyonu** s-uzayında (yani frekans uzayı/alanı) çıkışın girişe oranı olarak tanımlanmıştı, dolayısıyla çıkışın başka bir durum değişkeni seçilmesi otomatik olarak transfer fonksiyonunun ifadesinin de etkiledi. Yeni elde ettiğimiz transfer fonksiyonuna dikkat edilecek olursa, paydadaki ifadenin maksimum derecesi iki, yani ikinci dereceden bir polinom. Bu da yeni elde edilen transfer fonksiyonunda iki tane kökün olduğunu gösteriyor. Bu iki kök, iki durum değişkenine (i.e., hız ve pozisyon) tekabül ediyor. Ayrıca PID denetleyicimizin kazançları da yeniden ayarlanmak zorunda kaldı, çünkü artık üretilen kontrol sinyali hız kontrol probleminde olduğu gibi arabayı sabit bir hıza sabitlemeye çalışmıyor fakat arabanın konumunu (pozisyonunu) tek boyutlu kabul ettiğimiz yolda belirli bir referans noktasına/çizgisine götürmeye çalışıyor.
## 6. Hafta
İkinci haftada dinamiklerine göz atıp matematiksel modelini birinci dereceden adi diferansiyel denklemler kullanarak elde ettiğimiz pendulum (sarkaç) problemine geri dönüyoruz. Bu sefer sisteme durum uzayı gösteriminde giriş değişkeni işlevi görecek harici bir kuvveti bir eyleyici (actuator) vasıtasıyla uygulayacağız. Mesela sistemin moment noktası olan ekseni, bir servo veya adım (step) motorun miline geçirebiliriz ve böylece bu eksene uygulayacağımız Tork (Newton x metre) [3] veya *l* uzunluğundaki kütlesi ihmal edilen çubuğun ucundaki *m* kütleli yükün olduğu noktaya bir motor-pervane ikilisi takıp, motor-pervane eyleyicisinin *m* kütlesinin olduğu noktada oluşturacağımız itki kuvveti ile sisteme etki edebiliriz. 

## Video
Bu sayfa ile ilgili bilgi edinmek için aşağıdaki resime tıklayarak videoyu izleyebilirsiniz.</br>
[![IMAGE ALT TEXT HERE](şekil/thumbnail.png)](https://youtu.be/5p5_AzG9l2o)</br></br>


## Kaynaklar
[1] Pendulum dinamiği - https://www.mathworks.com/help/ident/ug/classical-pendulum-some-algorithm-related-issues.html</br>
[2] Araba hız kontrolü (cruise control) - https://ctms.engin.umich.edu/CTMS/index.php?example=CruiseControl&section=SystemModeling</br>
[3] Tork - https://tr.khanacademy.org/science/physics/torque-angular-momentum/torque-tutorial/v/introduction-to-torque
