class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "9de3bace4b1fd748e97014ea5cf05df50ad19381a4298b7b524c62ab82b41f4e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "cb0ce32ed445f0719ec43cb807424f1446a3f6a7a4d74bc9fc9e92c2eb31a823" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "1df91801b9bbbc848ab36ca9f8d6e0f79665218bdfa5b45654b0d903d68d4daa" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.164+7a834e258.tar.xz"
  version "0.12.0-dev.164+7a834e258"
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
