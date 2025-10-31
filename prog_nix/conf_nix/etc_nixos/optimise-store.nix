{
  nix = {
    settings = {
      # Автоматична оптимізація nix-store
      auto-optimise-store = true;
    };

    gc = {
      # Увімкнути автоматичне прибирання сміття
      automatic = true;
      # Запускати раз на тиждень
      dates = "weekly";
      # Видаляти покоління старші за 15 днів
      options = "--delete-older-than 15d";
    };

    # Зберігати метадані для швидшої роботи кешу
    extraOptions = ''
      keep-outputs = true
      keep-derivations = true
    '';
  };

  # 🔁 Автоматичне видалення старих поколінь (залишає тільки 15 останніх)
  systemd.services.cleanup-old-generations = {
    description = "Remove old NixOS generations, keeping only the last 15";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = ''
        /run/current-system/sw/bin/nix-env -p /nix/var/nix/profiles/system --delete-generations +10
      '';
    };
  };

  # 🕒 Запускати цей сервіс щотижня (можна частіше)
  systemd.timers.cleanup-old-generations = {
    description = "Weekly cleanup of old NixOS generations";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "weekly";
      Persistent = true;
    };
  };
}
