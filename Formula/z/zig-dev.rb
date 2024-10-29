class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ded729e750fe8ea9b657d8d1b4d28e5220d767c1a701ccba7508f10303881710" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e5b65955d5a3f57612f6c71404ce196abaebc5f6a1d81c708054aab156abc6a2" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e52cc34a9231827b5c7d8761f9f49105f24c309dad18afa4d7dbedcd9e7d94cd" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2063+5ce17ecfa.tar.xz"
  version "0.14.0-dev.2063+5ce17ecfa"
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
