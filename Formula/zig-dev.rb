class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f636713a5665beb1706fd18e94be39a05d5828dfe20219f0cfd9753581293905" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "117b37fbf4c60533d2faf317a8401dc94a19977256393badadb8fa62f673130a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e8562d79be00ca78e67c35a685c5178057e92505eab8f5861d5e43be4fc583ee" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2236+32e88251e.tar.xz"
  version "0.12.0-dev.2236+32e88251e"
  license "MIT"

  livecheck do
    skip "Dynamic `url` and `sha256`"
  end

  depends_on macos: :big_sur # https://github.com/ziglang/zig/issues/13313
  depends_on "z3"
  depends_on "zstd"
  uses_from_macos "ncurses"
  uses_from_macos "zlib"

  conflicts_with "zig", because: "both install a `zig` binary"

  def install
    bin.install "zig"
    lib.install "lib" => "zig"
  end
end
