class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "9bb352743e989aa98980402c0f0b323477681f19c808735bd5624a434cd5f95b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "770dd8302428718e517ee653a683585a090efdc63d8a58bfd0520f26a2e0aeb9" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "48f152805b4301dcabc312459a015ef2b3143b940f30194b6121a43a3f1fd3e5" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3880+910ad92e0.tar.xz"
  version "0.11.0-dev.3880+910ad92e0"
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
