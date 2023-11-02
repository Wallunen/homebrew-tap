class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "757ad61d0346ad4b9207e08d56624fdf02fac99dc33704023833e3dcfe8d1621" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "0d2de52c2c2fde3c47d047b65916bf8ce703ea588f45e14f733d7e3598c3595b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "23e638b0b2f37def3af8df73b220d21c01a4c54c8d61803e371584c0a1259027" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1383+7c5d01b95.tar.xz"
  version "0.12.0-dev.1383+7c5d01b95"
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
