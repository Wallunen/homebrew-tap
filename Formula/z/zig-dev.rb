class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "b6cc95aa0e7b6aaab92f77c857c1e734c2ff9e19409d44568947eaeab7b1422f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b3faf40d705726886f82e245c1e861f685e849014b06705d71cfd982ada162c2" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "4ac1ca24b1449e838210b5e4f2e3946608d2939404caba1d01e8a3e7d0711c53" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2623+7aa95bc7f.tar.xz"
  version "0.14.0-dev.2623+7aa95bc7f"
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
