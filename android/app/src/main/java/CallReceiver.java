public class CallReceiver extends BroadcastReceiver {
    @Override
    public void onReceive(Context context, Intent intent) {
        // Burada çağrı durumunu kontrol edin ve istediğiniz işlemleri gerçekleştirin
        String action = intent.getAction();

        if (action != null && action.equals(TelephonyManager.ACTION_PHONE_STATE_CHANGED)) {
            String phoneState = intent.getStringExtra(TelephonyManager.EXTRA_STATE);

            if (phoneState != null && phoneState.equals(TelephonyManager.EXTRA_STATE_RINGING)) {
                // Telefon çalıyor durumunda olduğunda yapılacak işlemler
                // Örneğin, veri kaydetme işlemi veya bildirim gösterme gibi
                Log.d("CallReceiver", "Telefon Çalıyor");
            }
        }
    }
}
