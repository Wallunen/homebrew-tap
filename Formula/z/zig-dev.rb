class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a36f382aeb6c4fdaa386994fdc452520e44a35c43ccaacac45cce4a311daf175" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "25cf39d25bf8bd5d62ceb35d44166cf5d39740157c8f51b11bf19afbe7aba4b1" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "94f513c51fba8525a9c3417268b116cf5c114b90885ea61057cd608edf840170" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.223+1f6b3d166.tar.xz"
  version "0.14.0-dev.223+1f6b3d166"
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
