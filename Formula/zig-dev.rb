class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8070e8b095e4d50b542cfb9add78352d1065111727673df6ec3cd5094a023ea9" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "63f851a52b7187b26800fafd8dfb27d461f1a0e6b936411c427d7b79df4a85b6" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "73ab9fa21f8f4d6c87443b4248b653f55abdab1db8331d392a75414e7c9235fd" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2139+e025ad7b4.tar.xz"
  version "0.12.0-dev.2139+e025ad7b4"
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
